class ArticleDecorator < ApplicationDecorator
  def created_at
    object.created_at.strftime("%A, %B %e")
  end
end
