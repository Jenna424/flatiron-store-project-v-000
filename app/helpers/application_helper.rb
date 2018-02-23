module ApplicationHelper
  
  def currency_conversion(number)
    number.to_f / 100
  end

end
