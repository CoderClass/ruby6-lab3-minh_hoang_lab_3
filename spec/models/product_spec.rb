require 'rails_helper'

RSpec.describe Product, type: :model do
  describe ".alphabetical" do
    it "return [] if there is no Product" do
      expect(Product.alphabetical).to eq []
    end
    it "returns [a,b,c] after I create 3 products c, b, a" do

      a = Product.new(:name => 'a')
      b = Product.new(:name => 'b')
      c = Product.new(:name => 'c')
      
      c.save(:validates => false)
      b.save(:validates => false)
      a.save(:validates => false)
      
      expect(Product.alphabetical).to eq [a, b, c]
    end
  end
end
