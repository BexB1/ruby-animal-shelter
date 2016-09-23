class Shelter

  attr_reader :name
  attr_accessor :clients, :animals

  def initialize(name)
    @name = name
    @capacity = 3
    @clients = []
    @animals = []
  end

  def add_client(name, age, gender, number_of_pets)
    client = Client.new(name, age, gender, number_of_pets)
    @clients << client
    client
  end

  def add_animal(name, breed, age, sex, favourite_toys)
    animal = Animal.new(name, breed, age, sex, favourite_toys)
    @animals << animal
    animal
  end

  def get_animals(index)
    @animals[index]
  end

  def adopt_animal(index)
    @animals.delete_at(index)
  end

  def is_full?
    @animals.length == @capacity
  end

end