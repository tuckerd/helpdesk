class Ticket < ActiveRecord::Base
  attr_accessible :answer, :question, :requested_by, :title
end
