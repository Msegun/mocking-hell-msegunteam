class Article < ApplicationRecord
  # it checks wether or not the title is minimum five letters long
  validates :title, presence: true, length: { minimum: 5 }
end
