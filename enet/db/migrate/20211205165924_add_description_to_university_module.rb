class AddDescriptionToUniversityModule < ActiveRecord::Migration[6.1]
  def change
    add_column :university_modules, :description, :string, default: 'This is a module provided by the University of Surrey', null: true
  end
end
