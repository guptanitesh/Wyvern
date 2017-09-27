class AnswersController < ApplicationController

  def new
  end

  def create

    ans = ''
    ansParas = {}
    @user = current_user
    @question = Question.find(params[:question_id])
    if !ans_params[:answer].nil?

    if @question.qtype

      if ans_params[:answer]['ans1'].to_s == '1'
        ans += 'A'
      end
      if ans_params[:answer]['ans2'].to_s == '1'
        ans += 'B'
      end
      if ans_params[:answer]['ans3'].to_s == '1'
        ans += 'C'
      end
      if ans_params[:answer]['ans4'].to_s == '1'
        ans += 'D'
      end

    else

      if ans_params[:answer][:ans0] == @question.option4
        ans += 'D'       
      elsif ans_params[:answer][:ans0] == @question.option3
        ans += 'C'
      elsif ans_params[:answer][:ans0] == @question.option2
        ans += 'B'
      else ans_params[:answer][:ans0] == @question.option1
        ans += 'A'
      end

    end
    end
    ansParas.merge!(ans: ans, score: 1, quizz_id: ans_params[:quizz_id], question_id: @question.id, user_id: @user.id)
    puts ansParas
    if Answer.find_by(question_id: @question.id, user_id: @user.id)
      @answer = Answer.find_by(question_id: params[:question_id], user_id: current_user.id)
      Answer.find_by(question_id: params[:question_id], user_id: current_user.id).update(ansParas)
    else
      Answer.new(ansParas).save
    end

    redirect_back fallback_location: root_path

  end

  private
  def ans_params
    params.permit(:quizz_id, :question_id, answer: [:ans0, :ans1, :ans2, :ans3, :ans4  ])
  end

end
