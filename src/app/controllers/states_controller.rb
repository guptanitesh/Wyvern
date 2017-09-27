class StatesController < ApplicationController

	def new
		
		@answers = []
		@user = current_user
		@answered = Answer.where(user_id: @user.id).all
		@quizz = Quizz.find(params[:quizz_id])
		@questions = Question.where(quizz_id: @quizz.id)
		
		@questions.count.times do
			@answers << Answer.new
		end
		
	end

	def result
		
		@user = current_user
		@questions = Question.where(quizz_id: params[:qid]).all
		@score = 0

		@questions.each do |question|
			@answer = Answer.find_by(user_id: @user.id, question_id: question.id)
			if !@answer.nil?
				if question.answer.to_s == @answer.ans.to_s
					@score = @score + 5
				end
				Answer.find_by(user_id: @user.id, question_id: question.id).destroy
			end
		end

		paras = {}
		paras.merge!(user_id: current_user.id, quizz_id: params[:qid], score: @score)
		
		if Score.find_by(user_id: @user.id, quizz_id: params[:qid])
			Score.find_by(user_id: @user.id, quizz_id: params[:qid]).update(paras)
		else
			Score.new(paras).save
		end
		@quizz = Quizz.find(params[:qid])
		@subcategory = Subcategory.find(@quizz.subcategory_id)
		@category = Category.find(@subcategory.category_id)
		
	end

end

