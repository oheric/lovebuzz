class QuizzesController < ApplicationController
  
  def index
    @quiz = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def new
    @quiz = Quiz.new
    3.times do 
      question = @quiz.questions.build
      4.times { question.answers.build }
    end
  end  

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:notice] = "Successfully created quiz."
      redirect_to @quiz
    else
      render :action => 'new'
    end
  end

  def edit 
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(quiz_params)
      flash[:success] = "Quiz updated"
      redirect_to @quiz
      # Handle a successful update
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:success] = "Quiz deleted"
    redirect_to quizzes_url
  end

  private

    def quiz_params
      params.require(:quiz).permit(:name, 
        :questions_attributes => [:id, :content, :_destroy,
        :answers_attributes => [:id, :content, :_destroy]
        ])
    end

end