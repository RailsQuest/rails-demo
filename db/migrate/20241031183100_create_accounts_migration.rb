class CreateAccountsMigration < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts
  end
end
