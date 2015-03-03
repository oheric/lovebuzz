class TraitsController < ApplicationController
  def index
    @traits = Trait.all
  end
  def new
    
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)
  end
end