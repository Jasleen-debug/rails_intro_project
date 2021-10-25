class Publisher < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
