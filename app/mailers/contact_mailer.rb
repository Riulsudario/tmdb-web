class ContactMailer < ApplicationMailer
  def contact_created
    subject = 'Nova mensagem recebida'

    mail(
      to: 'aaaa@aaaa.com.br',
      from: 'aaaa <noreply@aaaa.com.br>',
      subject: subject
    )
  end

end
