class UserMailer < ApplicationMailer
  def send_hundred(petition)
    @petition = petition
    @user = @petition.user
      mail to: @user.email, subject: 'Достигнута отметка в  100 голосов'      
  end

  def not_hundred(petition)
    @petition = petition
    @user = @petition.user
      mail to: @user.email, subject: 'Отметка в 100 голосов не достигнута'
  end

  def send_administartion(petition)
    @petition = petition
    @user = @petition.user
    mail to: 'administration@mail.com', subject: 'Примите к сведению!', template_name: 'sendTOadm'
  end
end
