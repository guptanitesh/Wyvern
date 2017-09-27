class LeaderboardsController < ApplicationController

	def new
	end

	def subcategory

		score = []
		tp = []
    	@subcategory = Subcategory.find(params[:sid])
    	quizzs = Quizz.where(subcategory_id: params[:sid])
		
		quizzs.each do |quizz|

			instance = Score.where(quizz_id: quizz.id).all
			instance.each do |curr|
			
				if !(tp.include? curr.user_id)
					tp << curr.user_id
					score << curr
				else
					score.select{ |element| element[:user_id] == curr.user_id }.first[:score] += curr.score
				end
			
			end

		end
		
		@scores = score.sort_by { |k| k["score"] }
		@users = []
		
		@scores.each do |score|
			@user = User.find(score.user_id)
			arr = {}
			arr.merge!(score: score.score, name: @user.name, username: @user.username)
			@users << arr
		end
	
	end

	def quizz

		score = Score.where(quizz_id: params[:qid]).all
		@scores = score.sort_by { |k| k["score"] }
		@users = []
		@quizz = Quizz.find(params[:qid])

		@scores.each do |score|
			@user = User.find(score.user_id)
			ar = {}
			puts score.score
			ar.merge!(score: score.score, name: @user.name, username: @user.username)
			@users << ar
		end
	end


	def category
		score = []
		tp = []
		@category = Category.find(params[:cid])
		subcategory = Subcategory.where(category_id: params[:cid]).all

		subcategory.each do |subcategory|
			quizzs = Quizz.where(subcategory_id: subcategory.id)
			quizzs.each do |quizz|
				instance = Score.where(quizz_id: quizz.id).all
				
				instance.each do |curr|
				
					if !(tp.include? curr.user_id)
						tp << curr.user_id
						score << curr
					else
						score.select{ |element| element[:user_id] == curr.user_id }.first[:score] += curr.score
					end

				end
			
			end
		
		end

		@score = score.sort_by { |k| k["score"] }
		@users = []

		@score.each do |score|
			@user = User.find(score.user_id)
			ar = {}
			ar.merge!(score: score.score, name: @user.name, username: @user.username)
			@users << ar
		end

	end

	private
	def leaderboard_params
		params.permit(:cid, :sid, :qid)
	end

end
