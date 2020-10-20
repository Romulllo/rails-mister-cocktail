class IngredientsController < ApplicationController

  def create
    @dose = Dose.find(params[:dose_id])
    @ingredients = Ingredient.where(id: params[:dose_id])
    @ingredients.each do |ingredient|
      @dose_ingredient = ingredient.new(dose: @dose, ingredient: ingredient)
      @dose_ingredient.save
    end
    redirect_to cocktail_path(@dose.cocktail)
  end
end
