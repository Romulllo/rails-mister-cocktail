Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")


require "json"
require "rest-client"

response = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
repos = JSON.parse(response)

repos['drinks'].each do |repo|
	ingredient = repo['strIngredient1']
	Ingredient.create!(name: ingredient)
end
