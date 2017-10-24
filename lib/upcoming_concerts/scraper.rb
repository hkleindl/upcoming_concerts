class UpcomingConcerts::Scraper

  def scrape_concerts
    @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))
  end

end
