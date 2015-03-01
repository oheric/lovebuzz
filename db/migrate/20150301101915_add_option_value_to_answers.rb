class AddOptionValueToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :option_value, :integer
  end
end
