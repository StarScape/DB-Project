class PackageMailer < ApplicationMailer

  def package_arrived_email
    @student = params[:student]
    mail to: @student.email, subject: 'Your package has arrived.'
  end
end
