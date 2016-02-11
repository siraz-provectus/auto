class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :registration_number
      t.string :pts
      t.datetime :pts_date

      t.timestamps null: false
    end
  end
end
