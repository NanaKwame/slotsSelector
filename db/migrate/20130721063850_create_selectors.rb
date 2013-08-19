class CreateSelectors < ActiveRecord::Migration
  def change
    create_table :selectors do |t|
      t.string :firstName
      t.string :lastName
      t.string :avatarImage
      t.integer :timesSelected
      t.timestamps
    end
  end
end
