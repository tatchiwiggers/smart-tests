class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[ show edit update destroy ]

  def index
    @questionnaires = Questionnaire.all
    user = current_user
    @quest_user = Questionnaire.where(user: user)
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaire_url(@questionnaire), notice: "Questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to questionnaire_url(@questionnaire), notice: "Questionnaire was successfully updated." }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: "Questionnaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(
      :name,
      questions_attributes: [
          :destroy,
          :id,
          :question_type,
          :name,
          answers_attributes: [:_destroy, :id, :name, :correct]
      ]
    )
  end
end
