class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :area, null: false
      t.belongs_to :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
