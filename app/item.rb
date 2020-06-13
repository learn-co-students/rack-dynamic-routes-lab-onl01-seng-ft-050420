class Item
  attr_accessor :name, :price

  @@item = []

  def initialize(name,price)
    @name = name
    @price = price
    @@item << self
  end

  def self.item
    @@item
  end

  # def find_by_name(name)
  #   Self.item.select{|item| item.name == name}
  #   item = 
end
