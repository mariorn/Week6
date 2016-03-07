class Sandwich < ActiveRecord::Base
  has_many :sandwich_ingredients
  has_many :ingredients, through: :sandwich_ingredients


  def as_json(options={})
    super(only: [:id, :name, :bread_type],
      methods: [:ingredients_count],
      include: [ingredients: {only: [:id, :name, :calories]}])
  end


  def ingredients_count
    self.ingredients.count
  end

end
