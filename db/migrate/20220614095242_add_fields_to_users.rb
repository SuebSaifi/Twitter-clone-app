class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
  add_column :users, :name, :string
  add_column :users, :username, :string
  add_index  :users, :username, unique: true
  #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
