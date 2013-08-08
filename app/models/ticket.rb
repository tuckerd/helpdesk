class Ticket < ActiveRecord::Base
  attr_accessible :answer, :question, :requested_by, :title

  validates :question, :requested_by, :title, presence: true

  def self.create_from_postmark(mitt)
      ticket = Ticket.new
      ticket.question = mitt.message_id
      ticket.title      = mitt.subject
      ticket.body = if mitt.text_body.blank?
        mitt.html_body
      else
        mitt.text_body
      end
      ticket.save
  end

end
