class ClassSurveysController < ApplicationController

  def create
      ClassSurveyMailer.survey.deliver_now
      redirect_to root_path, notice: "Email Sent"
  end
end
