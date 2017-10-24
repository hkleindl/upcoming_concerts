class UpcomingConcerts::CLI

  def call
    list_concerts
    select_concert
  end

  def list_concerts
    puts "Upcoming Concerts in Pittsburgh"
    puts
    UpcomingConcerts::Concert.new.list_all
    puts
  end

  def select_concert
    puts "Enter the number of the concert to see more details, type list to see list of concerts, or type exit."
    input = gets.chomp
       if input.to_i.between?(1, UpcomingConcerts::Concert.new.list_all.length)
        UpcomingConcerts::Concert.new.details(input)
      elsif input.downcase == "list"
        select_concert
      #   select_concert
      # elsif input == "2"
      #   puts "Concert 2 details"
      #   select_concert
      # elsif input == "3"
      #   puts "Concert 3 details"
      #   select_concert
      # elsif input == "exit"
      #   exit
      # elsif input == "list"
      #   list_concerts
      #   select_concert
      # else
      #   puts "Invalid input"
      #   select_concert
    end
  end

end
