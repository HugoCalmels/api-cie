class ContactMailer < ApplicationMailer

  def contact(contactDemand)
    
    @contact_demand = contactDemand
    mail(to: "gaelle.boucherit@gmail.com", subject: "Demande de contact depuis le site internet")

  end

end
