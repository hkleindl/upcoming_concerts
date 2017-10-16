# artist name = doc.css("h4 a[title]")[2].values[1] => just the third artist
# doc.css("h4 a[title]").collect {|i| i.values[1]} => all the artists names on page

class UpcomingConcerts::Concert

  @@all = []

  attr_accessor :artist, :date, :time, :venue, :url

  def self.list
    doc = Nokogiri::HTML(open("http://pittsburgh.eventful.com/events/categories/music"))
    binding.pry
  end

  def self.all
    @@all
  end

  def add_concert

  end




end
