class ContactMailer < ApplicationMailer

  def contact(contactDemand)
    
    @contact_demand = contactDemand
    mail(to: "calmels.hugo@yahoo.fr", subject: "Demande de contact depuis le site internet")

  end

end
