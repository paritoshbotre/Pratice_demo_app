class UserMailer < ApplicationMailer
  default from: 'paritosh271089@gmail.com'

  def send_upload_status_mail(file_name, user_email)
    p '*********************Upload'
    @file_name = file_name
    @user_email = user_email
    mail(to: 'paritoshbotre@joshsoftware.com', subject: 'Data Uploaded')
  end

  def send_error_log(user_email, e)
    p '********************* ERROR'
    @user_email = user_email
    @user_email = user_email
    @error = e
    mail(to: 'paritoshbotre@joshsoftware.com', subject: 'Sheet uploading error')
  end
end
