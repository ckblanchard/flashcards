class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.string :term
      t.text :definition
      t.text :hint

      t.timestamps
    end
  end
end
