class CreatePassengers < ActiveRecord::Migration[8.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.belongs_to :bookings

      t.timestamps
    end
  end
end
