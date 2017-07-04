class Keyword < ActiveRecord::Base
  belongs_to :site
  has_many :keyword_logs

  def log_at date
    keyword_logs.where(created_at: date.beginning_of_day..date.end_of_day).first
  end
end
