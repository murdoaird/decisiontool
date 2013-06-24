class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
