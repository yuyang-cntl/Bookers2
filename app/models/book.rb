class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :body, 
  presence: true,
  length: { minimum: 1, maxmum: 200 }
end
