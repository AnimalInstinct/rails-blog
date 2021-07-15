class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 100 }
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
end
