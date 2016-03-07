class IngredientsController < ApplicationController
	def index
	  ingredients = Ingredient.all
	  render json: ingredients
	end

	def create
	  ingredient = Ingredient.create(ingredient_params)
	  render json: ingredient
	end

	def show
	  ingredient = Ingredient.find_by(id: params[:id])
	  unless ingredient
	    render json: {error: "ingredient not found"},
	    status: 404
	    return
	  end
	  render json: ingredient
	end

	def update
	  ingredient = Ingredient.find_by(id: params[:id])
	  unless ingredient
	    render json: {error: "ingredient not found"},
	    status: 404
	    return
	  end
	  ingredient.update(ingredient_params)
	  render json: ingredient
	end

	def destroy

		sandwich = Sandwich.find_by(id: params[:sandwich_id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end

	  ingredient = sandwich.ingredients.find_by(id: params[:id])
	  unless ingredient
	    render json: {error: "ingredient not found"},
	    status: 404
	    return
	  end


		sandwich.ingredients.destroy(ingredient)

	  render json: sandwich
	end


	private

	def sandwich_params
	  params.require(:ingredient)
	    .permit(:name, :calories)
	end
end
