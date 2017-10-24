class UpcomingConcerts::CLI

  def call
    UpcomingConcerts::Scraper.new.scrape_concerts
    list_concerts
    # select_concert
  end

  def list_concerts
    puts "Upcoming Concerts in Pittsburgh"
    puts
    UpcomingConcerts::Concert.all.each_with_index do |concert, i|
      puts "#{i + 1}. #{concert.artist}"
    end
    puts
  end

  def select_concert
    input = nil
    while input != "exit"
      puts "Enter the number of the concert for more info, or type exit."
      input = gets.strip
    end
  end

end
