class AddDecisionIdToElement < ActiveRecord::Migration
  def change
    add_column :elements, :decision_id, :integer
  end
end
