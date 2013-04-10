class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :organization_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
