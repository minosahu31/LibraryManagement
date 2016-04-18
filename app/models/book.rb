class Book < ActiveRecord::Base
	validates :title, presence: true
	validates :category_id, presence:true
	validates :category_id, numericality: true, unless: "category_id.blank?"
	validates :description, presence: true
	validates :description, length: {minimum: 10}, unless: "description.blank?"

	belongs_to :category 
	has_many :user_books
	has_many :users, through: :user_books
	#scope :created_before, ->(time) { where("created_at < ?", time) }
	#scope :published_last_week, -> { where('created_at <= ?', 1.week.ago) }
end
