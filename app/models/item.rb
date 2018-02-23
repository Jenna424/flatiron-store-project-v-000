class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items # class method returns 'array' of item instances whose inventory attribute values are > 0
    self.where("inventory > '0'")
  end
  # above is same as:
  # def self.available_items
  #   where('inventory > ?', 0)
  # end
end
