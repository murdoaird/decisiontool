class CreateDecisionElements < ActiveRecord::Migration
  def change
    create_table :decision_elements do |t|
      t.integer :decision_id
      t.integer :element_id

      t.timestamps
    end
  end
end
