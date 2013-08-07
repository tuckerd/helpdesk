class TicketMailer < ActionMailer::Base
  default from: "new_ticket_deamon@helpdesk.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.new_ticket.subject
  #
  def new_ticket(ticket)
    @ticket = ticket
    mail to: "danielle@tuckerlabs.com",
      subject: @ticket.title
  end
end
