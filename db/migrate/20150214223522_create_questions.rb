class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :name
      t.boolean :answer

      t.timestamps null: false
    end
  end
end
