class Ingredient
  VALID_INGREDIENTS = ['brussels sprouts',
              'spinach',
              'eggs',
              'milk',
              'tofu',
              'seitan',
              'bell peppers',
              'quinoa',
              'kale',
              'chocolate',
              'beer',
              'wine',
              'whiskey']

  attr_reader :name, :quantity, :unit

  def initialize(quantity, unit, name)
    @quantity = quantity
    @unit = unit
    @name = name
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end

  def valid_ingredient?
    VALID_INGREDIENTS.include?(@name.downcase)
  end

  def self.parse(input)
    split = input.split(" ")
    quantity = split[0].to_f
    unit = split[1]
    name = split[2..-1].join(" ")

    Ingredient.new(quantity, unit, name)
  end

end

class Recipe
  attr_reader :name
  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def summary
    <<-SUMMARY
Name: #{name}

#{print_each_ingredient}


#{print_each_instruction}

#{allergy?}
    SUMMARY
  end

  def print_each_ingredient
    result = "Ingredient: "
    @ingredients.each do |ingredient|
       result <<"\n- #{ingredient.summary}"
    end
    result
  end

  def print_each_instruction
     result = "Instruction: "
    @instructions.each_with_index do |instruction, i|
      result << "\n#{i + 1}. #{instruction}"
   end
   result
  end

  def allergy?
   allergy = ""
    @ingredients.each do |ingredient|
      if ingredient.valid_ingredient?
        allergy << "\nIf you eat #{ingredient.name} you will live"
      else
        allergy << "\nIf you eat #{ingredient.name} you will die"
      end
    end
    allergy
  end



end

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

recipe = Recipe.new(name, instructions, ingredients)
puts recipe.summary

puts Ingredient.parse("1.5 lb(s) Brussels sprouts").summary

