require 'nokogiri'
require 'open-uri'

task :cron => [ "collect:items" ]

namespace :collect do
  task :items => [ "collect:links", "collect:sites", "collect:relateds" ]

  task :links => :environment do
    Site.all.each do |site|
      SiteLog.create_or_update({
        :site_id => site.id,
        :links => Google.links(site.domain),
        :checked_on => Date.today,
      })
    end
  end

  task :sites => :environment do
    Site.all.each do |site|
      SiteLog.create_or_update({
        :site_id => site.id,
        :sites => Google.sites(site.domain),
        :checked_on => Date.today,
      })
    end
  end

  task :relateds => :environment do
    Site.all.each do |site|
      SiteLog.create_or_update({
        :site_id => site.id,
        :relateds => Google.relateds(site.domain),
        :checked_on => Date.today,
      })
    end
  end
end
