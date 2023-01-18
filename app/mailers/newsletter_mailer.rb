class NewsletterMailer < ApplicationMailer

  def newsletter(template, email, token)

    @token = token
    @email = email
    @template = template.html_safe
    mail(to: email, subject: "Newsletter de Gaëlle Boucherit.")
  end

end
