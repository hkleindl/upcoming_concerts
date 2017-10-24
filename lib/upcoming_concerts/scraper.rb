# @artists = @doc.css("td.artist span")
# @venue = @doc.css("td.venue a[itemprop=url]")
# @date = @doc.css("td.date a")
# @tickets_url = @doc.css("td.artist a").collect {|i| i.attribute('href').to_s}
# @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))


class UpcomingConcerts::Scraper

  def scrape_concerts
    @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
    @doc.search("tr.microformats").each do |tr|
      concert = UpcomingConcerts::Concert.new
      concert.artist = tr.css("td.artist span").text
      concert.date = tr.css("td.date a").text
      concert.venue = tr.css("td.venue a[itemprop=url]").text
      concert.tickets_url = tr.css("td.artist a").attr("href").value
      concert.save
    end
  end

end
