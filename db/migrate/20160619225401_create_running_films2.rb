class CreateRunningFilms2 < ActiveRecord::Migration
  def change
    create_table :running_films do |t|
    	t.integer :film_id
    	t.string :time
    	t.string :seats, :default => []

    	t.timestamps null: false
    end
  end
end
