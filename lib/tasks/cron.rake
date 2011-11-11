require 'nokogiri'
require 'open-uri'

task :cron => [ "collect:items" ]

namespace :collect do
  task :items => [ "collect:links" ]

  task :links => :environment do
    Site.all.each do |site|
      links = Google.links site.domain
      SiteLog.create_or_update({
        :site_id => site.id,
        :links => links,
        :checked_at => DateTime.now.strftime("%Y-%m-%d"),
      })
    end
  end
end
