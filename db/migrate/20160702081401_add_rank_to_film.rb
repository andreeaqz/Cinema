class AddRankToFilm < ActiveRecord::Migration
  def change
    add_column :films, :rank, :integer, :default => 0
  end
end
