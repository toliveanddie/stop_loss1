module WelcomeHelper
  
  def stock_name(name, key)
    timeseries = Alphavantage::Timeseries.new symbol: name, key: key
    return timeseries.symbol
  end
  
  def stop_loss_price(name, entry, loss, key)
    indicator = Alphavantage::Indicator.new function: "ATR", symbol: name, key: key, interval: "daily", time_period: "14"
    range = indicator.atr[0][1].to_f
    timeseries = Alphavantage::Timeseries.new symbol: name, key: key
    close = timeseries.close[0][1].to_f
    close_stop = close - range
    entry_stop = entry - range
    if entry_stop > close_stop
      @stock = Stock.find_by name: name
      @stock.stop_loss = entry_stop
      @stock.save!
      return @stock.stop_loss
    else
      if close_stop > loss
        @stock = Stock.find_by name: name
        @stock.stop_loss = close_stop
        @stock.save!
        return @stock.stop_loss
      else
        @stock = Stock.find_by name: name
        return @stock.stop_loss
      end
    end
  end
  
end
