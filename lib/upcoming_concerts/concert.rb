# artist = doc.css("td.artist span").text
# date = doc.css("td.artist span").text
# venue = doc.css("td.venue a[itemprop=url]").text
# tickets_url = doc.css("td.more a").attr("href").value

class UpcomingConcerts::Concert

  def doc
    @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
  end

  def artists
    @artists = @doc.css("td.artist span").text
  end

  def self.list_all
    # doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
    # @artists = doc.css("td.artist span")
    artists.each_with_index.collect {|artist, i| puts "#{i + 1}. #{artist.text}"}
    # binding.pry
  end

  def self.find(input)
    # doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))

    # @artists = doc.css("td.artist span")
    puts @artists[input - 1].text
    # binding.pry
  end



end
