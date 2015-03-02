class AddResultsAssociationToQuiz < ActiveRecord::Migration
  def self.up
    add_column :results, :quiz_id, :integer
    add_index 'results', ['quiz_id'], :name => 'result_value_index_quiz_id'
  end

  def self.down 
    remove_column :results, :quiz_id
  end
end
