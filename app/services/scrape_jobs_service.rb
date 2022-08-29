require "open-uri"
require "nokogiri"

class ScrapeJobsService
  # def initialize(keyword)
  #   @keyword = keyword
  # end

  def call
    url = "https://www.tokyodev.com/jobs"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search(".jobs-list__item").first(4).map do |job_card|
      {
        title: job_card.search(".job-title .link-reset").first.text.strip,
        company: job_card.search(".company-title").text.strip,
        url: "https://www.tokyodev.com#{job_card.search(".job-title .link-reset").attribute("href").value}"
      }
    end
  end
end
