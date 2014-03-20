class OrdersController < ApplicationController
	def show
		if current_user.is_admin?
			@order = Order.find(params[:id])
		else
			@order = current_user.orders.find(params[:id])
		end
		@images=@order.images
		@attachments = @order.attachments
		respond_to do |format|
			format.html
			format.pdf do
				pdf = OrderPdf.new(@order, view_context)
	        # pdf.font "#{Rails.root}/app/assets/font/simsun.ttf"
	        send_data pdf.render, filename: "order_#{@order.id}.pdf",
	        type: "application/pdf",
	        disposition: "inline"
	    	end
		end
	end

	def upload
		# if authenticate_admin_user?
		@order = Order.find(params[:id])
		@paintings = @order.images
		# else
			# render "/"
		# end
	end
end
