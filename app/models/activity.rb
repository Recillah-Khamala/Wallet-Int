class Activity < ApplicationRecord
    belongs_to :User

    has_many :activity_categories
    has_many :categories, through: :activity_categories
  
    validates :name, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
end
