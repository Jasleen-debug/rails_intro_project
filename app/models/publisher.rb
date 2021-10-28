class Publisher < ApplicationRecord
  has_many :books
  validates :name, presence: true, uniqueness: true
  paginates_per 10
end
