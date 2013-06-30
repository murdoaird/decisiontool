class AddNormalisedToCalculations < ActiveRecord::Migration
  def change
    add_column :calculations, :normalised, :string
  end
end
