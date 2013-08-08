class Ticket < ActiveRecord::Base
  attr_accessible :answer, :question, :requested_by, :title

  validates :question, :requested_by, :title, presence: true

  def self.update_from_postmark(mitt)
      ticket_id = mitt.to.split("@").first.split("+").last
      ticket = Ticket.find(ticket_id)
      ticket.answer = mitt.text_body
      ticket.save
  end

end
