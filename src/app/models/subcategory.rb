class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :quizzs, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :category_id, presence: true
end
