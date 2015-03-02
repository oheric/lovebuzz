class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :result_value
      t.string :content
    end
  end
end
