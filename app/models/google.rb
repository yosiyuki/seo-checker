require 'nokogiri'
require 'open-uri'

class Google
  SEARCHPATH = {
    jp: "http://www.google.co.jp/search?gcx=w&ie=UTF-8&q=",
    en: "http://www.google.com/search?gcx=w&ie=UTF-8&q=",
    vn: "http://www.google.com.vn/search?gcx=w&ie=UTF-8&q=",
  }
  OUTOFSEARCH = 100

  def self.links site
    count_by linkpath(site)
  end

  def self.sites site
    count_by sitepath(site)
  end

  def self.relateds site
    count_by relatedpath(site)
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

  def self.rank site, keyword
    doc = Nokogiri::HTML(open(rankpath(keyword, site.lang)))
    matchdomain = Regexp.new(site.domain)
    doc.css("li.g").each_with_index do |item, index|
        return index + 1 if item.to_s.match(matchdomain)
    end
    return OUTOFSEARCH
  end

  private

  def self.searchpath lang
    self::SEARCHPATH[lang.to_sym]
  end

  def self.linkpath site
    self::searchpath(site.lang) + "link%3A" + site.domain
  end

  def self.sitepath site
    self::searchpath(site.lang) + "site%3A" + site.domain
  end

  def self.relatedpath site
    self::searchpath(site.lang) + "related%3A" + site.domain
  end

  def self.rankpath keyword, lang
    self::searchpath(lang) + "#{URI.encode(keyword)}&safe=off&num=#{self::OUTOFSEARCH}"
  end
end
