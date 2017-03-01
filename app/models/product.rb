class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical 
    all.order(:name)
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end
end
