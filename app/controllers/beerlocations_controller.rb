class BeerlocationsController < ApplicationController
	def index
		@beerlocation = Beer.search_for(params[:q])
	end

	def new
		@beerlocation = Beerlocation.new
	end

	def create
		@beerlocation = Beerlocation.new(safe_beerlocaiton_params)
		if @beerlocation.save
			redirect_to root_path
		else
			render :new
		end
	end


	private

	def safe_beerlocaiton_params
		return params.require(:beerlocation).permit(:price, :comments)
	end

end



