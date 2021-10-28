class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
  validates :title, :isbn, :publication_date, :num_pages, :average_listing, presence: true
  validates :title, :isbn, uniqueness: true
  validates :num_pages, numericality: { only_integer: true }
  validates :average_listing, numericality: true
  paginates_per 10

  def self.search(keywords)
    if keywords
      where("title LIKE ?", "%#{keywords}%").order("average_listing DESC")
    else
      order("average_listing DESC")
    end
  end

  def authors_list
    authors.map(&:name).join(", ")
  end
end
