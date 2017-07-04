class KeywordLog < ActiveRecord::Base
  belongs_to :keyword

  def self.create_on(date, attributes)
    record = where(keyword_id: attributes[:keyword_id])\
        .where(created_at: date.beginning_of_day .. date.end_of_day).first
    record.blank? ? create(attributes) : record
  end

  def self.create_for keyword
    record = keyword.log_at(Time.zone.now) || new(keyword_id: keyword.id)
    g = Google.new keyword.site
    record.attributes = { rank: g.rank(keyword.word), url: g.url(keyword.word) }
    record.save
  end
end
