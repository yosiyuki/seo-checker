require 'nokogiri'
require 'open-uri'

class Google
  LINKPATH = "http://www.google.co.jp/search?gcx=w&ie=UTF-8&q=link%3A"

  def self.links domain
    doc = Nokogiri::HTML(open(self::LINKPATH + domain))
    doc.xpath("//div[@id='subform_ctrl']/div[2]/b[2]").text.gsub(/,/, "").to_i
  end
end
