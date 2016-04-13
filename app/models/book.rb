class Book < ActiveRecord::Base
	belongs_to :category 
	has_many :user_books
	has_many :users, through: :user_books
	#scope :created_before, ->(time) { where("created_at < ?", time) }
	#scope :published_last_week, -> { where('created_at <= ?', 1.week.ago) }
end
