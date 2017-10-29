# @artists = @doc.css("td.artist span")
# @venue = @doc.css("td.venue a[itemprop=url]")
# @date = @doc.css("td.date a")
# @tickets_url = @doc.css("td.artist a").collect {|i| i.attribute('href').to_s}
# @doc = Nokogiri::HTML(open("http://www.bandsintown.com/cities/pittsburgh-pa"))


class UpcomingConcerts::Concert

  attr_accessor :artist, :date, :venue, :tickets_url

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  # Can't get this to work
  def open_in_browser
    link = "http://www.bandsintown.com/cities/pittsburgh-pa"
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
      system "start #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      system "open #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
      system "xdg-open #{link}"
    end
  end

end
