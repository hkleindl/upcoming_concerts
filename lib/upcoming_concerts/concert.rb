# @artists = @doc.css("td.artist span")
# @venue = @doc.css("td.venue a[itemprop=url]")
# @date = @doc.css("td.date a")
# @tickets_url = @doc.css("td.artist a").collect {|i| i.attribute('href').to_s}
# @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))


class UpcomingConcerts::Concert

  attr_accessor :artist, :date, :venue, :tickets_url

  def initialize(artist = nil, date = nil)
    @artist = artist
    @date = date
  end

  def doc
    @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
  end

  def artist
    @artist = doc.css("td.artist span").text
    binding.pry
  end

  # def self.all
  #   a = @artists.each_with_index.collect {|artist, i| puts "#{i + 1}. #{artist.text}"}
  # end
  #
  # def find(input)
  #   @artists[input - 1].text
  # end
  #
  # def details(input)
  #   puts "#{@artists[input - 1].text}"
  #   puts "#{@venue[input - 1].text} - #{@date[input - 1].text}"
  #   puts "You can buy tickets at http://www.bandsintown.com#{@tickets_url[input - 1]}"
  #
  # end



end
