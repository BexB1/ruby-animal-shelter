require_relative 'lib/shelter'
require_relative 'lib/animal'
require_relative 'lib/clients'

@shelter = Shelter.new("Sacred Heart Animal Shelter")

def menu
  puts `clear`
  print "
       < :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >
       < ::::::::::::            ::::::::::::            :::::::::::: >
       < :::::::::                   ::::                   ::::::::: >
       < :::::::         ********     ::     ********         ::::::: >
       < :::::      ****          ****  ****         ****       ::::: >
       < ::::     ****               ****               ****     :::: >
       < :::     ****                 **                 ****     ::: >
       < :::     ****                                    ****     ::: >
       < ::::     ****                                  *****    :::: >
       < :::::     ****                                ****     ::::: >
       < :::::::     ****                            ****     ::::::: >
       < :::::::::     ****                        ****     ::::::::: >
       < :::::::::::     ****                    ****     ::::::::::: >
       < ::::::::::::::      ****            ****      :::::::::::::: >
       < :::::::::::::::::       ****    ****       ::::::::::::::::: >
       < ::::::::::::::::::::        ****        :::::::::::::::::::: >
       < :::::::::::::::::::::::      **      ::::::::::::::::::::::: >
       < :::::::::::::::::::::::::          ::::::::::::::::::::::::: >
       < :::::::::::::::::::::::::::      ::::::::::::::::::::::::::: >
       < :::::::::::::::::::::::::::::  ::::::::::::::::::::::::::::: >
       < :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: >
"
  puts "\n\n ********** Welcome to #{@shelter.name} **********\n\n"
  puts "\n 1: Register yourself as a client of the shelter."
  puts "\n 2: Put your pet up for adoption."
  puts "\n 3: See a list of animals up for adoption."
  puts "\n 4: Adopt an animal."
  puts "\n 5: [Staff Only] See a list of registered clients."
  puts "\n Q: Exit menu.\n\n"

  print "                          
     ,                    , e`--o
    ((                   (  | __,
     \\~----------------' \_;/
     (                      /
     /) ._______________.  )
    (( (               (( (
     ``-'               ``-'"

  print "\n\n"

  gets.chomp
end

def list_animals
  @shelter.animals.each.with_index do |animal, index|
    str ="#{index+1}.\t#{animal}"
    puts str
  end
end

def list_clients
  @shelter.clients.each.with_index do |client, index|
    str ="#{index+1}.\t#{client}"
    puts str
  end
end


response = menu

while response.upcase != "Q"

  case response

  when "1" #Add new client
    puts "What is your full name?"
    name = gets.chomp

    puts "How old are you?"
    age = gets.chomp

    puts "What gender are you?"
    gender = gets.chomp

    puts "How many pets do you have?"
    number_of_pets = gets.to_i

    client = @shelter.add_client(name, age, gender, number_of_pets)

    puts "\n\n Press any key to continue."
    gets


  when "2" #Put pet up for adoption
    if @shelter.is_full?
      puts "We're sorry, but the shelter is currently at full capacity. Please check back later."

    else
      puts "What is your pet's name?"
      name = gets.chomp

      puts "What is your pet's breed?"
      breed = gets.chomp

      puts "How old (in years) is your pet?"
      age = gets.chomp

      puts "What sex is your pet?"
      sex = gets.chomp

      puts "Does your pet have any favourite toys?"
      favourite_toys = gets.chomp

      animal = @shelter.add_animal(name, breed, age, sex, favourite_toys)

      puts "\n\n #{name} has been accepted."

    end

    puts "\n\n Press any key to continue."
    gets


  when "3" #list animals
    list_animals

    puts "\n\n"
    puts "Press any key to continue."
    gets

  when "4" #adopt

    puts "You need to be a client of the shelter to adopt. Please enter your full name."
    client_name = gets.chomp

    client = @shelter.clients.find { |client| client.name.downcase == client_name.downcase }

    if client == nil

      puts "Sorry, please register as a client."

    else
      list_animals

      puts "\n Which animal would you like to adopt?"
      puts "\n\n"

      animal_index = gets.to_i - 1

      chosen_pet = @shelter.animals[animal_index]

      puts "\n That animal has been reserved for adoption."

      animal = @shelter.adopt_animal(animal_index)
      
    end

    gets


  when "5" #List clients
    list_clients

    puts "\n\n"
    puts "Press any key to continue."
    gets

  end

  response = menu

end
