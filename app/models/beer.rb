class Beer < ActiveRecord::Base
	has_many :beerlocations
	
	def self.search_for(query)
			Beer.where("beer_name LIKE :query OR category LIKE :query" , :query => "%#{query}%")
	end

end
