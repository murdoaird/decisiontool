class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :decision_id
      t.integer :a_element_id
      t.integer :b_element_id
      t.decimal :a_value
      t.decimal :b_value

      t.timestamps
    end
  end
end
