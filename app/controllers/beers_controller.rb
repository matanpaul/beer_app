class BeersController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def new
		@beer = Beer.new
		@locations = Location.new
		@beerlocation = Beerlocation.new
	end

	def create
		@beer = Beer.new(safe_beer_params)
		@locations = Location.new
		@beerlocation = Beerlocation.new

		@location = params[:location]
		@price = params[:beerlocation][:price]
		@locations.name = Location.where(name: @location.capitalize).first_or_create
			

		@beer = Beer.where(beer_name: @beer.beer_name).first_or_create
		@beer.save

		@beerlocation.user = current_user
		@beerlocation.location = Location.where(name: @location.capitalize).first_or_create
		@beerlocation.beer = Beer.where(beer_name: @beer.beer_name).first
		@beerlocation.price = @price.to_i
		@beerlocation.save
		redirect_to root_path	
	
	end


	def show
		@beer = Beer.find(params[:id])
		@beerlocation = Beerlocation.find_all_by_beer_id(params[:id])	
		#@location_id_via_beerlocation = @beerlocation.location_id
		#@location = Location.where(id: @location_id_via_beerlocation)
	end

	private

	def safe_beer_params
		return params.require(:beer).permit(:beer_name, :category)
	end

	# def safe_beerlocaiton_params
	# 	return params.require(:beerlocation).permit(:price, :comments)
	# end

end
