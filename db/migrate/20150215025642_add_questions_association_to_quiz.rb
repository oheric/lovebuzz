class AddQuestionsAssociationToQuiz < ActiveRecord::Migration
  def self.up 
    add_column :questions, :quiz_id, :integer
    add_index :'questions', ['quiz_id'], :name => 'index_quiz_id'
  end

  def self.down
    remove_column :questions, :quiz_id
  end
end
