require 'nokogiri'
require 'open-uri'

task cron: [ "site:collect", "keywords:collect" ]

namespace :site do
  task collect: [ "site:links", "site:sites", "site:relateds" ]

  task links: :environment do
    Site.all.each do |site|
      puts "== CHECK UP LINKS #{site.domain}"
      SiteLog.create_or_update({
        site_id: site.id,
        links: Google.links(site),
        checked_on: Date.today,
      })
    end
  end

  task sites: :environment do
    Site.all.each do |site|
      puts "== CHECK UP SITES #{site.domain}"
      SiteLog.create_or_update({
        site_id: site.id,
        sites: Google.sites(site),
        checked_on: Date.today,
      })
    end
  end

  task relateds: :environment do
    Site.all.each do |site|
      puts "== CHECK UP RELATED #{site.domain}"
      SiteLog.create_or_update({
        site_id: site.id,
        relateds: Google.relateds(site),
        checked_on: Date.today,
      })
    end
  end
end

namespace :keywords do
  task collect: [ "keywords:rank" ]

  task rank: :environment do
    Keyword.all.each do |keyword|
      next if keyword.log_at Time.zone.now
      puts "== CHECK UP KEYWORD #{keyword.word}"
      KeywordLog.create_for keyword
    end
  end
end

namespace :cleanup do
  task clean: ["cleanup:keyword_log", "cleanup:site_log"]

  task keyword_log: :environment do
    KeywordLog.where('created_at < ?', 3.month.ago).delete_all
  end

  task site_log: :environment do
    SiteLog.where('created_at < ?', 3.month.ago).delete_all
  end
end
