class Ticket < ActiveRecord::Base
  attr_accessible :answer, :question, :requested_by, :title

  validates :question, :requested_by, :title, presence: true

  def self.create_from_postmark(mitt)
      ticket = Ticket.new
      ticket.question = mitt.message_id
      ticket.title      = mitt.subject
      ticket.question = mitt.text_body
      ticket.save
  end

end
