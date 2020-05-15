class OrderDecorator < ApplicationDecorator
  def date_start
    object.date_start.strftime('%A, %B %e')
  end
end
