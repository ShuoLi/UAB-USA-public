class UsersController < ApplicationController
	helper_method :sort_column, :sort_direction, :search_order
	def show
	    #@user = User.find(params[:user_id])
	    # @orders = current_user.orders.all
	    @orders = current_user.orders
	    @orders =@orders.order(sort_column + " " + sort_direction).page(params[:page]).per(40)
	    parameters={}
	    parameters["current_user"]=current_user.id
	    if (params.has_key?(:search_text))
	    	parameters["search_text"] = params[:search_text]
	    	@orders = Order.findOrders(parameters).page(params[:page]).per(40)
	    end


	    # if orderstemp.class==Array
	    # 	@orders =  Kaminari.paginate_array(orderstemp).page(params[:page]).per(40) 
	    # else
	    # 	@orders = orderstemp.page(params[:page]).per(40)
	    # end
	    # @orders = current_user.orders.all.paginate(page: params[:page], per_page: 10)  |
	    # @orders =@orders.order(sort_column + " " + sort_direction).page(params[:page]).per(40)

	 #    if params[:search].nil?
	 #    	@orders =@orders.order(sort_column + " " + sort_direction).page(params[:page]).per(40)
	 #    elsif params[:search].blank?
	 #    	@orders =@orders.order(sort_column + " " + sort_direction).page(params[:page]).per(40)
	 #    else
  # 			@orders = search_order(params[:search]) # this is just a method I created for my project.
		# end
	end

	def sort_column
		Order.column_names.include?(params[:sort]) ? params[:sort] : "id"
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

	def search_order(search)
		# Order.find(:user_id=current_user.id,:VIN=search)
	end

end
