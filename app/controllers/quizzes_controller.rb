class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
    3.times { @quiz.questions.build }
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      flash[:notice] = "Successfull created quiz."
      redirect_to @quiz
    else
      render :action => 'new'
    end
  end

  def edit 
    @quiz = Quiz.find(params[:id])
  end

end