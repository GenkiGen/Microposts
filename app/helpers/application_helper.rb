module ApplicationHelper
  def format_date(date) 
    date.strftime("%d/%m/%y")
  end

  def format_date_time(datetime)
    datetime.strftime("%k:%M %d/%m/%y")
  end

  def random_color
    @colors ||= %w[danger info success warning primary link]
    @colors[rand(@colors.count)]
  end
end
