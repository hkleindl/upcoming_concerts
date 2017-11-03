class UpcomingConcerts::CLI

  def initialize
    UpcomingConcerts::Scraper.new.scrape_concerts
    call
  end

  def call
    list_concerts
    select_concert
    buy_tickets
  end

  def list_concerts
    puts "~Upcoming Concerts in Pittsburgh~"
    puts
    UpcomingConcerts::Concert.all.each_with_index do |concert, i|
      puts "#{i + 1}. #{concert.artist}"
    end
    puts
  end

  def select_concert
    puts "Enter the number of concert to see more information, type 'list' to see the list of concerts again, or type 'exit'."
    input = gets
      if input.to_i.between?(1, UpcomingConcerts::Concert.all.length)
        @concert = UpcomingConcerts::Concert.all[input.to_i - 1]
        puts
        puts "-#{@concert.artist}-"
        puts "Performing at #{@concert.venue} on #{@concert.date}."
        puts
      elsif input.strip.downcase == "list"
        call
      elsif input.strip.downcase == "exit"
        exit
      else
        puts "Invalid input"
        send __method__
      end
  end

  def buy_tickets
    puts "Type 'tickets' to go to ticket site, type 'list' to see list of concerts, or type 'exit'."
    input = gets.strip
      if input.downcase == "tickets"
        puts
        puts "To buy tickets, visit http://www.bandsintown.com#{@concert.tickets_url}"
        puts
        send __method__
      elsif input.downcase == "list"
        call
      elsif input.downcase == "exit"
        exit
      else
        puts "Invalid input."
        send __method__
      end
  end

end
