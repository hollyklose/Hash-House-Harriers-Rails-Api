class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.string :description
      t.string :hare
      t.string :bag_car

      t.timestamps
    end
  end
end
