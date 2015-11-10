class ExampleJob < ActiveJob::Base
  queue_as :default

  def perform(file_path, user_email)
    p '******* Performing JOB ***************' 
    Product.import(file_path) 
    UserMailer.send_upload_status_mail(file_path, user_email).deliver_now
  end

  def send_error_message(user_email, e)
    UserMailer.send_error_log(user_email, e).deliver_now
  end

end
