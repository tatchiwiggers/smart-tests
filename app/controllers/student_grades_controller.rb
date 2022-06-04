class StudentGradesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def save_score
    StudentGrade.create(score: params["score"].to_i, user_id: current_user.id, questionnaire_id: params[:id])
  end
end
