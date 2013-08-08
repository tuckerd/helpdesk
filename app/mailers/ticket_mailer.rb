class TicketMailer < ActionMailer::Base
  default from: "danielle@tuckerlabs.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.new_ticket.subject
  #
  def new_ticket(ticket)
    @ticket = ticket
    mail to: "jacksbac@hotmail.com",
      subject: "Ticket ID: #{ticket.id} #{@ticket.title}",
      reply_to: "0a033594f53514fea3230d23ae335cfd+#{ticket.id}@inbound.postmarkapp.com" 
  end
end
