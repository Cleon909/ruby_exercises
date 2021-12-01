#script to pick the biggest difference from two numbers in a set with lowest number first
def stock_picker(prices)
  output_hash = {}
  prices.each_with_index do |buy_price, buy_day|
    prices.each_with_index do|sell_price, sell_day| 
      if sell_day>buy_day
      output_hash["#{buy_day}, #{sell_day}"] = sell_price - buy_price
      end
    end
  end
  pick = output_hash.max_by {|days, profit| profit}
  p "day to buy and day to sell = #{pick[0]}. Profit = #{pick[1]}"
end

stock_picker([100, 2, 5, 4, 10, 1])