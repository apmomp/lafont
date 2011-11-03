module BillsHelper

  def edit_bill_path_regex
    /(bills\/\d+\/(edit(\?section=\d+)?|bill_lines\?food_id=\d+)\/?$|bill_lines\/\d+|food_cats\/\d+\/(expand|contract)+)/
  end
  
  def bill_total_price(bill)
    "Total: #{number_with_precision(bill.foods.sum(:price), :precision => 2)}€"
  end

end
