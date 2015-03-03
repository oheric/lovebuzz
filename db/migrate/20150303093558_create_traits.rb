class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.text :content
      t.references :user, index: true
      t.references :quiz, index: true
    end
  end
end
