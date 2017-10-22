# artist = doc.css("td.artist span").text
# date = doc.css("td.artist span").text
# venue = doc.css("td.venue a[itemprop=url]").text
# tickets_url = doc.css("td.more a").attr("href").value

class UpcomingConcerts::Concert



  def initialize
    @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
    @artists = @doc.css("td.artist span")
    @venue = @doc.css("td.venue a[itemprop=url]")
    @date = @doc.css("td.date a")
    @tickets_url = @doc.css("td.artist a").collect {|i| i.attribute('href').to_s}
  end

  def list_all
    a = @artists.each_with_index.collect {|artist, i| puts "#{i + 1}. #{artist.text}"}
  end

  def find(input)
    @artists[input - 1].text
  end

  def details(input)
    puts "#{@artists[input - 1].text}"
    puts "#{@venue[input - 1].text} - #{@date[input - 1].text}"
    puts "You can buy tickets at http://www.bandsintown.com#{@tickets_url[input - 1]}"

  end



end
