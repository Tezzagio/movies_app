class Movie < ActiveRecord::Base


	validates :name, presence: true, uniqueness: true
	validates :description, presence: true


	def self.search(search)
		self.where("name LIKE ?", "%#{@search}%").first
	end

end
