class AddPaperclipToQuizzes < ActiveRecord::Migration
  def change
    add_attachment :quizzes, :image
  end
end
