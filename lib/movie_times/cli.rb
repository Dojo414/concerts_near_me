class MovieTimes::CLI 
  
  def call 
    puts "Hello! Welcome to Concerts Near Me!"
    puts "Please enter the name of your city:"
    city = gets_city
    puts "Thank You! Now please enter to 2 letter abbreviation for your state: (e.g. FL)"
    state = gets_state
    puts city
    puts state
    
  end
  
  def gets_city
    city = gets.chomp
    city
  end
  
  def gets_state
    input = nil
    while input.length != 2
      input = gets.chomp
      if input.length != 2 
        puts "Sorry that is not a valid state please try again:"
      else
        state = input
      end
    end
  state
end
      

end