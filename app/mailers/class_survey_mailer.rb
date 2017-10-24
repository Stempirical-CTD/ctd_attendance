class ClassSurveyMailer < ApplicationMailer

  require 'mail'
  default from: ''


  def survey
    mail(to: "CTD@#{MAILGUN_CONFIG[:mailgun_domain]}", subject: 'Class Survey')
  end
end
