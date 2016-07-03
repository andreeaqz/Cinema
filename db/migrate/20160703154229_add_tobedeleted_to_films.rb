class AddTobedeletedToFilms < ActiveRecord::Migration
  def change
    add_column :films, :tobedeleted, :integer, :default => 0
  end
end
