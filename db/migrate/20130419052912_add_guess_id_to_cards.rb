class AddGuessIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :guess_id, :integer
  end
end
