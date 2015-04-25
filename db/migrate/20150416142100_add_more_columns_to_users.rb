class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :fb_link, :string
    add_column :users, :gender, :string
    add_column :users, :locale, :string
    add_column :users, :timezone, :string
  end
end
