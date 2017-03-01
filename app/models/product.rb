class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical 
    all.order(:name)
  end

  def discount_amount
  	discount_percent = case price_vnd

  	when 0..100000
  		1
  	when 100000..200000
  		0.21
  	when 200000..800000
  		0.31
  	else
  		0.41
  	end

  	self.price_vnd = price_vnd * discount_percent
  	self.save
  end

  def final_price
 	minh_map = self.price_vnd % 10000
 	
 	case minh_map
 	when 1000..4000
 		self.price_vnd = price_vnd - minh_map
 	when 5000..9000
 		self.price_vnd = price_vnd + minh_map
 	end
 	
 	save
  end

  def on_sale?
  	
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end

end
