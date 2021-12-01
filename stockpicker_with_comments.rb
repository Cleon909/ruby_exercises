#script to pick the biggest difference from two numbers in a set with lowest number first
def stock_picker(prices)
  # early code which works if lowest number in set comes before highest number in the set
  # # if prices.index(prices.min) < prices.index(prices.max)
  # #   pick = Array.new
  # #   pick << prices.index(prices.min)
  # #   pick << prices.index(prices.max)
  # #   p pick
  # #   profit = (prices.max - prices.min)
  # #   p "profit per stock = " + profit.to_s
  # # end

  # code to take each element in the array and calcualte the difference the result and the respective indexes are placed into output hash
    output_hash = {}
    prices.each_with_index { |buy_price, buy_day|
     prices.each_with_index {|sell_price, sell_day| 
     if sell_day>buy_day
     output_hash["#{buy_day}, #{sell_day}"] = sell_price - buy_price
     end
    }
    }
    #picks out the max value of output hash, and puts the relevant info in a string
    pick = output_hash.max_by {|days, profit| profit}
    p "day to buy and day to sell = #{pick[0]}. Profit = #{pick[1]}"
  
  

end


stock_picker([100, 2, 5, 4, 10, 1])