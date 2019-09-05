# frozen_string_literal: true

class TeamCreationMailer < ApplicationMailer
  default from: 'inform_team_creation@example.com'

  def team_creation_report(name)
    mail(
      to: 'ovidiu.kiss@unifiedpost.com',
      message: 'empty',
      subject: 'Team creation report',
      body: "A new team has been created : #{name}"
    )
  end
end
