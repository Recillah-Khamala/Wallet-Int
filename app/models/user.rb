class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # associations
  has_many :activities
  has_many :categories

  # Validations
  validates :first_name, :last_name, presence: true 
  validates :email, :password, presence: true
end
