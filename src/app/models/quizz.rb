class Quizz < ApplicationRecord
  
  belongs_to :subcategory
  has_many :questions, dependent: :destroy
  has_many :answers,  dependent: :destroy
  has_many :scores,  dependent: :destroy

end
