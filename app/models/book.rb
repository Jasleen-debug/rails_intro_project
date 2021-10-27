class Book < ApplicationRecord
  belongs_to :publisher
  validates :title, :isbn, :publication_date, :num_pages, :average_listing, presence: true
  validates :title, :isbn, uniqueness: true
  validates :num_pages, numericality: { only_integer: true }
  validates :average_listing, numericality: true
  paginates_per 50
end
