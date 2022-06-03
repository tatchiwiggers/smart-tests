class StudentGradesController < ApplicationController
  def create
    @grade = StudentGrade.new
    @grade.user = current_user
    @grade.score = params[:score]
    @grade.questionnaire = Questionnaire.find(params[:id])
  end
end
