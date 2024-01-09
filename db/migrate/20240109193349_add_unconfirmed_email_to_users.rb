class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :unconfirmed_email, :string
  end

  def down 
    remove_columns :users, :unconfirmed_email
  end
end
