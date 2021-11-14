class CreateUserModules < ActiveRecord::Migration[5.2]
  def change
    create_table :user_modules do |t|
      t.string :user_id
      t.string :module_id

      t.timestamps
    end
  end
end
