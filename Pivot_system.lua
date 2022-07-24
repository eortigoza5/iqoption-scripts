instrument {overlay = true,
            name = 'Pivot System',
            short_name = 'PBOT',
            icon="indicators:ADX"}
pivbuy =low[2] < low[3] and low[1] > low[2] and high[2] < high[3] and high[1] > high[2] and close[1] > close[3]
pivsell =high[2] > high[3] and high[1] < high[2] and low[2] > low[3] and low[1] < low[2] and close[1] < close[3]

plot_shape(pivbuy, "BUY", shape_style.arrowup, shape_size.large, "green", shape_location.belowbar, -1, "buy","green" )
plot_shape(pivsell, "SELL", shape_style.arrowdown, shape_size.large, "red", shape_location.abovebar, -1, "Sell", "red" )


color = iff (pivbuy, "lime", iff(pivsell,"red", nil))

-- plot_candle (open, high, low, close, "Pivot", color)
