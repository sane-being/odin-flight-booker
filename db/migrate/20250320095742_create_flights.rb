class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_datetime
      t.datetime :arrival_datetime

      t.timestamps
    end
  end
end
