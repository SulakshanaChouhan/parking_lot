class CreateParkingSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_spots do |t|
      t.integer :distance_from_entry
      t.boolean :occupied

      t.timestamps
    end
  end
end
