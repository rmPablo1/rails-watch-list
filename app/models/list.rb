class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_one_attached :background_image
end
