class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :orientation, :string
    add_column :users, :zipcode, :integer
    add_column :users, :country, :string
    add_column :users, :username, :string
    add_column :users, :userbio, :string
  end
end
