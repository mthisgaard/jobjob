require "open-uri"
require "nokogiri"

class ScrapeJobs
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://japan-dev.com/jobs?query=#{@keyword}"
    html_doc = Nokogiri::HTML(URI.open(url).read)
    html_doc.search(".job-item__main-data").map do |job_card|
      job_card.search(".job-item__title-box").attribute("href").value
    end
  end
end
