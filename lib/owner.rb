# require_relative 'cat.rb'
# require_relative 'dog.rb'

class Owner
  
  attr_reader :name, :species
  @@all =[]

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    return "I am a #{species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
    cats
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    dogs
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets_to_sell = self.dogs.concat(self.cats)

    pets_to_sell.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end