class Review < ApplicationRecord
  belongs_to :list
  validates :content, presence: true
  validates :content, length: { minimum:10, maximum: 150 }
  validates :rating, numericality: { only_integer: true }
  validates :rating, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
