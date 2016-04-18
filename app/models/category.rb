class Category < ActiveRecord::Base
	validates :name, presence: true
	validates :name,length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\Z/, message: "Only allows letters....." }, unless: "name.blank?"
	has_many :books, dependent: :destroy
end
