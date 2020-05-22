class OrderDecorator < ApplicationDecorator
  def date_start
    object.date_start.strftime('%d-%m-%Y %I:%M')
  end
end
