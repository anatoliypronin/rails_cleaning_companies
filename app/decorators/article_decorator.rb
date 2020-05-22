class ArticleDecorator < ApplicationDecorator
  def created_at
    object.created_at.strftime('%d-%m-%Y %I:%M')
  end
end
