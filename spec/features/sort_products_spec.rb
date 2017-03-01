require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do
  def hat_links
    page.all(:css, "h4.product-name a").collect(&:text)
  end

  it "Test hat_links" do
    product1 = Product.new(:name => "Minh map")
    product2 = Product.new(:name => "ga minh")

    product1.save(:validates => false)
    product2.save(:validates => false)
    
    visit root_path

    expect(hat_links).to eq [product1.name, product2.name]
    
    click_link "Sort by Alphabetical"

    expect(hat_links).to eq [product2.name, product1.name]

  end
end
