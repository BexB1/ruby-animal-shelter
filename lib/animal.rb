class Animal

  attr_reader :name, :breed, :age, :sex, :favourite_toys

  def initialize(name, breed, age, sex, favourite_toys)
    @name = name
    @breed = breed
    @age = age
    @sex = sex
    @favourite_toys = favourite_toys
  end

  def to_s
    "#{name}, a #{sex} #{breed} who is #{age} years old and whose favourite toy is #{favourite_toys}. \n\n"
  end

end

