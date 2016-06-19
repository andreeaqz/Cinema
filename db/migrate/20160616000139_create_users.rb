class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nume
      t.string :prenume
      t.string :telefon
      t.string :email
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
