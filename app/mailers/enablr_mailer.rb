class EnablrMailer < ApplicationMailer
  def refund_enablr_email

    @user = params[:user]
    @enablr = params[:enablr]
    @project = Project.find(@enablr.project_id)

    mail(to: @user.email, subject: 
         "Refund for #{@project.name} pledge"
        )
  end
end
