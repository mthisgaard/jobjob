require "open-uri"
require "nokogiri"

class ScrapeJobs
  def initialize(search_term)
    @search_term = search_term
  end

  def call
    url = "https://japan-dev.com/jobs?query=#{@search_term}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".job-item__main-data").each do |element|
      puts element.text.strip
      puts element.attribute("href").value
    end
  end
end
