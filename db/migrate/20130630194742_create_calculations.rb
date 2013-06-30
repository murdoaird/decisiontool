class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.integer :decision_id
      t.integer :element_id
      t.string :value

      t.timestamps
    end
  end
end
