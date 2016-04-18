class User < ActiveRecord::Base
	
  validates :name, presence: true
  validates :name, length: { minimum: 2 }, format: { with: /\A[a-zA-Z]+\Z/, message: "Only allows letters....." }, unless: "name.blank?" 	 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :user_books      
   has_many :books, through: :user_books
end
