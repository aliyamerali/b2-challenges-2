class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :ride, foreign_key: true
      t.references :mechanic, foreign_key: true

      t.timestamps
    end
  end
end
