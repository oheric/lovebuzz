class AddQuizzesAssociationToUser < ActiveRecord::Migration
  def self.up 
    add_column :quizzes, :user_id, :integer
    add_index 'quizzes', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :quizzes, :user_id 
  end
end
