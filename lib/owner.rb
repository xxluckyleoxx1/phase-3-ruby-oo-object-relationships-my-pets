class Owner
  # code goes here
  attr_reader :name, :species
  
  @@all = []


  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length()
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each do |dog_instance|
      if dog_instance.owner == self
        dog_instance.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |cat_instance|
      if cat_instance.owner == self
        cat_instance.mood = "happy"
      end
    end
  end

  def sell_pets
    Cat.all.each do |cat_instance|
      if cat_instance.owner == self
        cat_instance.mood = "nervous"
        cat_instance.owner = nil
      end
    end
    Dog.all.each do |dog_instance|
      if dog_instance.owner == self
        dog_instance.mood = "nervous"
        dog_instance.owner = nil
      end
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end