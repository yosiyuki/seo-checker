module ApplicationHelper
  def n number
    number_with_delimiter(number, :delimiter => ",")
  end
end
