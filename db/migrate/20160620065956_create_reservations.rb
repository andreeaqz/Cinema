class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :running_film_id
      t.integer :user_id
      t.string  :seats

      t.timestamps null: false
    end
  end
end
