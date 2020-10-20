class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:edit, :update, :destroy, :show]

  def index
    @cocktails = Cocktail.all    
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end    
  end

  def edit    
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktails_path
    else
      render :edit
    end    
  end

  def destroy
    @cocktail.delete
    redirect_to cocktails_path
  end

  def show    
  end

  private

  def cocktail_params
    params.require(:cocktail).permit( :name )    
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
