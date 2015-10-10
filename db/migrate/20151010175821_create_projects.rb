class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_number_str
      t.text :project_description

      t.timestamps null: false
    end
  end
end
