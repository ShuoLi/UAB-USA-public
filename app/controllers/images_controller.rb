class ImagesController < ApplicationController
	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new(key: params[:key])
	end
  
	def create 
		@image = Image.create(params[:image])
	end
end
