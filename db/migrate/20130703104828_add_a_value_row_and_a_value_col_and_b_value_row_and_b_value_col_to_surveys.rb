class AddAValueRowAndAValueColAndBValueRowAndBValueColToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :a_value_row, :integer
    add_column :surveys, :a_value_col, :integer
    add_column :surveys, :b_value_row, :integer
    add_column :surveys, :b_value_col, :integer
  end
end
