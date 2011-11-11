class SiteLog < ActiveRecord::Base
  belongs_to :site

  scope :after, lambda { |date|
      where([ "checked_at > ?", date ])
    }

  def self.create_or_update args
    if item = where({
        :checked_at => args[:checked_at],
        :site_id => args[:site_id] }).first
      item.update_attributes({ :links => args[:links] })
    else
      create(args)
    end
  end
end
