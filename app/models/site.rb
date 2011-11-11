class Site < ActiveRecord::Base
  has_many :site_logs

  validates :name, :presence => true, :length => { :minimum => 5, :maximum => 20 }
end
