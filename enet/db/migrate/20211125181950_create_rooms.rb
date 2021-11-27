class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :university_module_id

      t.timestamps
    end
    add_index :rooms, :name, unique: true
    add_index :rooms, :university_module_id, unique: true
  end
end
