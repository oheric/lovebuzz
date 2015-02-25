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
    3.times { @quiz.questions.build }
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

  private

    def quiz_params
      params.require(:quiz).permit(:name, 
        :questions_attributes => [:id, :content])
    end

end