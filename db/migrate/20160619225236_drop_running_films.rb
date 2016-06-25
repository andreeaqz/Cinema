class DropRunningFilms < ActiveRecord::Migration
  def change
  	drop_table :running_films
  end
end
