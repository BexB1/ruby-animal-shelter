class Client

  attr_reader :name, :age, :gender, :number_of_pets

  def initialize(name, age, gender, number_of_pets)
    @name = name
    @age = age
    @gender = gender
    @number_of_pets = number_of_pets
  end

  def to_s
    " Name: #{name} \n\t Gender: #{gender} \n\t Age: #{age} \n\t Pets: #{number_of_pets} \n\t"
  end

end