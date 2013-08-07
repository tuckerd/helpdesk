class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :question
      t.text :answer
      t.string :requested_by

      t.timestamps
    end
  end
end
