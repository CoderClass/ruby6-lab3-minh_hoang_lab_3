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


  describe "#discount_amount" do
    it "Hats that cost > 100,000 VND are going to be 21\% off." do
      minh_map = Product.new(price_vnd: 150000)

      minh_map.discount_amount
      minh_map.save(validates: false)

      expect(minh_map.price_vnd).to eq(150000 * 21 / 100)
    end

    it "Hats that cost t > 200,000 VND are going to be 31\% off." do
      minh_map = Product.new(price_vnd: 250000)

      minh_map.discount_amount
      minh_map.save(validates: false)

      expect(minh_map.price_vnd).to eq(250000 * 31 / 100)
    end

    it "Hats that cost > 800,000 VND are going to be 41\% off." do
      minh_map = Product.new(price_vnd: 1000000)

      minh_map.discount_amount
      minh_map.save(validates: false)

      expect(minh_map.price_vnd).to eq(1_000_000 * 41 / 100)
    end
  end

  describe "#final_price" do
    it "If the product cost 115,000 after discount, the final price should be 120,000." do
      minh_map = Product.new(price_vnd: 115_000)

      minh_map.final_price
      puts "minh map #{minh_map.price_vnd}"
      minh_map.save(validates: false)

      expect(minh_map.price_vnd).to eq(120_000)
    end

    it "If the product cost 114,000 after discount, the final price should be 110,000." do
      minh_map = Product.new(price_vnd: 114_000)

      minh_map.final_price
      minh_map.save(validates: false)

      expect(minh_map.price_vnd).to eq(110_000)
    end

  end

end


