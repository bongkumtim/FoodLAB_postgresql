class RecipesController < ApplicationController
	before_action :find, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all.order(created_at: :desc)
	end

	def show
		
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
        byebug
        
		if @recipe.save
			redirect_to @recipe, notice: "Successfully created a new recipe"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
		   redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		if @recipe.destroy
		   redirect_to root_path
		end
	end


	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, ingredient_attributes: [:id, :name, :_destroy], directions_attribute: [:id, :step, :_destroy])
	end

	def find
		@recipe = Recipe.find(params[:id])
	end
end
