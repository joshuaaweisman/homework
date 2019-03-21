require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end


describe Dessert do
  let(:chef) { double("chef") }
  let(:runts) { Dessert.new("Runts", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(runts.type).to eq("Runts")
    end

    it "sets a quantity" do
      expect(runts.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(runts.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Thin Mints", "lots", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      runts.add_ingredient("limes")
      expect(runts.ingredients).to include("limes")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["lemons", "bananas", "oranges", "cherries"]
      ingredients.each { |ingredient| runts.ingredients << ingredient }
      runts.mix!
      expect(runts.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do


    it "subtracts an amount from the quantity" do
      
    end

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
