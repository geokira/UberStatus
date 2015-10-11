class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :profile
      t.string :name
      t.text :impact
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
