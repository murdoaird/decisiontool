class ChangeDataTypeForAValueBValue < ActiveRecord::Migration
  def up
    change_column :surveys, :a_value, :string
    change_column :surveys, :b_value, :string
  end

  def down
    change_column :surveys, :a_value, :string
    change_column :surveys, :b_value, :string
  end
end
