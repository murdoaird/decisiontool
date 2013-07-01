class AddRowIdToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations, :row_id, :integer
  end
end
