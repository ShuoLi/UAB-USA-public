require 'carrierwave/processing/mime_types'
class AttachmentUploader < CarrierWave::Uploader::Base

  # include CarrierWave::RMagick
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  include CarrierWave::MimeTypes

  IMAGE_EXTENSIONS = %w(png)
  DOCUMENT_EXTENSIONS = %w(pdf)

  storage :fog

  def store_dir
    "documents/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
   IMAGE_EXTENSIONS + DOCUMENT_EXTENSIONS
  end

  # create a new "process_extensions" method.  It is like "process", except
  # it takes an array of extensions as the first parameter, and registers
  # a trampoline method which checks the extension before invocation
  def self.process_extensions(*args)
   extensions = args.shift
    args.each do |arg|
     if arg.is_a?(Hash)
      arg.each do |method, args|
        processors.push([:process_trampoline, [extensions, method, args]])
      end
     else
      processors.push([:process_trampoline, [extensions, arg, []]])
     end
    end
   end

   # our trampoline method which only performs processing if the extension matches
   def process_trampoline(extensions, method, args)
    extension = File.extname(original_filename).downcase
    extension = extension[1..-1] if extension[0,1] == '.'
    self.send(method, *args) if extensions.include?(extension)
   end

   # def cover 
   #  manipulate! do |frame, index|
   #   frame if index.zero?
   #  end
   # end   

  # version :thumb do
  #  process :cover    
  #   #process :resize_to_limit => [110, 60]
  #  process_extensions IMAGE_EXTENSIONS, :resize_to_fit => [110, 60]
  #  process :convert => 'png'
  # end

  process :set_content_type
  # process :save_content_type_and_size_in_model 
  # 
  # def save_content_type_and_size_in_model
  #   model.content_type = file.content_type if file.content_type
  #   model.file_size = file.size
  # end
end