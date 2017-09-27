class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :quizz
  belongs_to :question
end
