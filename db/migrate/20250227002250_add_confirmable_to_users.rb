class AddConfirmableToUsers < ActiveRecord::Migration[7.2]
  def up
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_index :users, :confirmation_token, unique: true

    User.update_all(confirmed_at: DateTime.now)
  end

  def down
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :unconfirmed_email
    remove_index :users, :confirmation_token
  end
end
