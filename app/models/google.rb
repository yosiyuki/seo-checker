require 'nokogiri'
require 'open-uri'

class Google
  SEARCHPATH = "http://www.google.co.jp/search?gcx=w&ie=UTF-8&q="

  def self.links domain
    count_by linkpath(domain)
    doc = Nokogiri::HTML(open(linkpath(domain)))
    doc.xpath("//div[@id='subform_ctrl']/div[2]/b[2]").text.gsub(/,/, "").to_i
  end

  def self.sites domain
    count_by sitepath(domain)
  end

  def self.relateds domain
    count_by relatedpath(domain)
  end

  def self.count_by url
    doc = Nokogiri::HTML(open(url))
    doc.xpath("//div[@id='subform_ctrl']/div[2]/b[2]").text.gsub(/,/, "").to_i
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
