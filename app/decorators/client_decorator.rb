class ClientDecorator < ApplicationDecorator
  def full_name
    object.name + ' ' + object.surname
  end
end
