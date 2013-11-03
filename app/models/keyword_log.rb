class KeywordLog < ActiveRecord::Base
  belongs_to :keyword

  def self.create_on(date, attributes)
    record = where(keyword_id: attributes[:keyword_id])\
        .where(created_at: date.beginning_of_day .. date.end_of_day).first
    record.blank? ? create(attributes) : record
  end
end
