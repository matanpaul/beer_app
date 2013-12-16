class Beerlocation < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	belongs_to :beer

		def self.search_by_location(query)
			Beerlocation.where("location_name LIKE :query" , :query => "%#{query}%")
		end

		def self.search_by_beer_id(query)
			Beerlocation.where("beer_id LIKE :query" , :query => "%#{query}%")
		end
end
