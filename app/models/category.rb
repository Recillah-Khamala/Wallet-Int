class Category < ApplicationRecord
  belongs_to :user

  has_many :activity_categories
  has_many :activities, through: :action_categories
  
  validates :name, presence: true
  validates :icon, presence: true
end
