class CreateUsers < ActiveRecord::Migration
  def change
    # create tables named users, the plural of the model name
    create_table :users do |t|

      # define the attributes (columns), and give them a type, 
      # in this case a string
      t.string :email
      t.string :password

      #this will add created_at and updated_at fields, both
      #timestamps
      t.timestamps null: false
    end
  end
end
