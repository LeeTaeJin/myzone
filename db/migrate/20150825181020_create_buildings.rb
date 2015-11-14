class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      
      t.string :name
      t.string :en_name
      t.string :img
      
      t.timestamps null: false
    end
  end
end
