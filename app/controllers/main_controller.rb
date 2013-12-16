class MainController < ApplicationController


	def index
		@beers = Beer.search_for(params[:q])
	end

	def show
		@beers = Beer.search_for(params[:q])	
	end

	def how_it_works
	end


end
