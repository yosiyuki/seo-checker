class SiteLog < ActiveRecord::Base
  belongs_to :site

  scope :after, lambda { |date|
      where([ "checked_on > ?", date ])
    }

  def self.create_or_update args
    if item = where({
        :checked_on => args[:checked_on],
        :site_id => args[:site_id] }).first
      args.delete(:site_id)
      args.delete(:checked_on)
      item.update_attributes(args)
    else
      create(args)
    end
  end
end
