class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  validates :name, presence: true, uniqueness: true
  paginates_per 10
end
