class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates_uniqueness_of :name
  # validates :description, presence: true, length: { minimum: 10 }
end
