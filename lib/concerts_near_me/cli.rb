class ConcertsNearMe::CLI 
  
  def call 
    puts "Hello! Welcome to Concerts Near Me!"
    puts "Please enter the name of your city:"
    city = gets_city
    puts "Thank You! Now please enter to 2 letter abbreviation for your state: (e.g. FL)"
    state = gets_state
    puts""
    page = ConcertsNearMe::Scraper.get_page(city,state)
    list = ConcertsNearMe::Scraper.get_list(page)
    concerts = ConcertsNearMe::Scraper.create_concerts_from_list(list)
    list_concerts(concerts)
    puts ""
    puts "Please select the concert you would like info about by number:"
    print_concert_info(concerts)
    puts ""
    puts "Would you like to hear about another concert near you? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      call
    else 
      puts "Thank you for using Concerts Near Me! Have a musical day!"
  end
end
  
  def gets_city
    city = gets.chomp
    city
  end
  
  def gets_state
    input = ""
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

def list_concerts(concerts_array)
  i = 1 
  concerts_array.each do |concert|
    puts "#{i}. #{concert.acts}"
    i += 1 
  end
end

def print_concert_info(concert_array)
  number = gets.chomp.to_i
  puts ""
  puts "Acts: #{concert_array[number - 1].acts}"
  puts "Venue: #{concert_array[number - 1].venue}"
  puts "City: #{concert_array[number - 1].city}"
  puts "State: #{concert_array[number - 1].state}"
  puts "Country: #{concert_array[number - 1].country}"
  puts "Date: #{concert_array[number - 1].date}"
  puts ""
  puts ""
  puts "Additional Details are below"
  concert_array[number - 1].additional_details.each do |detail|
    puts detail.text 
  end
end

end