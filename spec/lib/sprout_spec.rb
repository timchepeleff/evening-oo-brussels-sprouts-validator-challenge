require_relative "../../code"

RSpec.describe Ingredient do
    let (:ingredient){ ingredient = Ingredient.new(1.5, "lb(s)", "Brussels sprouts") }
  describe "#valid_ingredient?" do
    it "returns true if valid ingredient" do
      ingredient = Ingredient.new(1.5, "lb(s)", "Brussels sprouts")
       expect(ingredient.valid_ingredient?).to eq(true)
    end

    it "returns false if invalid ingredient" do
      ingredient = Ingredient.new(1.5, "lb(s)", "Wine")
        expect(ingredient.valid_ingredient?).to eq(true)
    end


 end

end

RSpec.describe Recipe do



end
