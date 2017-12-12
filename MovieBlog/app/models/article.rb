class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  # it checks wether or not the title is minimum five letters long
  validates :title, presence: true, length: { minimum: 5 }
end
