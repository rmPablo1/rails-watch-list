class Bookmark < ApplicationRecord
  has_one_attached :photo
  validates :photo, presence: true
  belongs_to :list
  validates :title, presence: true
  validates :list_id, presence: true
  validates :comment, length: { minimum: 25 }
  validates :rating, numericality: { only_integer: true }
  validates :rating, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
