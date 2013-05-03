require 'nokogiri'
require 'open-uri'

class Google
  SEARCHPATH = "http://www.google.co.jp/search?gcx=w&ie=UTF-8&q="

  def self.links domain
    count_by linkpath(domain)
  end

  def self.sites domain
    count_by sitepath(domain)
  end

  def self.relateds domain
    count_by relatedpath(domain)
  end

  def self.count_by url
    doc = Nokogiri::HTML(open(url))
    match = doc.xpath("//div[@id='resultStats']").text.match(/([\d,]+)/)
    unless match
      Rails.logger.warn "#{doc}"
      return false
    end
    match[0].gsub(/,/, "").to_i
  end

  def self.linkpath domain
    self::SEARCHPATH + "link%3A" + domain
  end

  def self.sitepath domain
    self::SEARCHPATH + "site%3A" + domain
  end

  def self.relatedpath domain
    self::SEARCHPATH + "related%3A" + domain
  end
end
