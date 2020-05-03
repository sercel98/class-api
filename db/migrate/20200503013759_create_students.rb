class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
