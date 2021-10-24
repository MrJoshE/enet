class CreateUniversityModules < ActiveRecord::Migration[5.2]
  def change
    create_table :university_modules do |t|
      t.string :identifier
      t.string :name
      t.string :module_leader

      t.timestamps
    end
  end
end
