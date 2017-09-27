class Score < ApplicationRecord
  belongs_to :quizz
  belongs_to :user
end
