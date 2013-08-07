class Ticket < ActiveRecord::Base
  attr_accessible :answer, :question, :requested_by, :title

  validates :question, :requested_by, :title, presence: true
end
