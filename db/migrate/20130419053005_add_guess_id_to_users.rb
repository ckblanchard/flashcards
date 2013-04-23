class AddGuessIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guess_id, :integer
  end
end
