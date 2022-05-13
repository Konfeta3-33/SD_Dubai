class AddLoginToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login, :string, null: false, index: { unique: true }
  end
end
