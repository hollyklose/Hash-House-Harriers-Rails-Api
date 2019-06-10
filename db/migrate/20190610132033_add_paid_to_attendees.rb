class AddPaidToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :paid, :integer
  end
end
