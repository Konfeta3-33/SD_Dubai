class AddLoginToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login, :string, null: false # rubocop:disable Rails/NotNullColumn
  end
end
