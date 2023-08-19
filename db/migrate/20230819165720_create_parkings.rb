class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.integer :spot_assigned
      t.string :car_registration_number
      t.string :car_color
      t.boolean :is_active
      t.string :ticket_number

      t.timestamps
    end
  end
end
