instrument {overlay = true,
            name = 'Auto-Fibonacci Retracement',
            short_name = 'FSNR',
            icon="indicators:AO"}


FPeriod = input (120, "front.period", input.integer, 1)

Fhigh = highest(FPeriod)
Flow = lowest(FPeriod)
FH = bars_since_highest(high[3], FPeriod)
FL = bars_since_lowest(low[3], FPeriod)
-- FH = highest(high[1], FPeriod)
-- FL = lowest(low[1], FPeriod)
downfibo = FH < FL

F0 = iff (downfibo, Flow, Fhigh)
F236 = iff (downfibo, (Fhigh - Flow) * 0.236 + Flow, Fhigh - (Fhigh - Flow) * 0.236)
F382 = iff (downfibo, (Fhigh - Flow) * 0.382 + Flow, Fhigh - (Fhigh - Flow) * 0.382)
F500 = iff (downfibo, (Fhigh - Flow) * 0.500 + Flow, Fhigh - (Fhigh - Flow) * 0.500)
F618 = iff (downfibo, (Fhigh - Flow) * 0.618 + Flow, Fhigh - (Fhigh - Flow) * 0.618)
F786 = iff (downfibo, (Fhigh - Flow) * 0.764 + Flow, Fhigh - (Fhigh - Flow) * 0.764)
F1000 = iff (downfibo, (Fhigh - Flow) * 1.000 + Flow, Fhigh - (Fhigh - Flow) * 1.000)
-- F1618 = iff (downfibo, (Fhigh - Flow) * 1.168 + Flow, Fhigh - (Fhigh - Flow) * 1.618)

Fcolor = iff (downfibo, "Yellow", "White")
Foffset = iff (downfibo, FH, FL)

hline{F0, '0', Fcolor, 2, Foffset, style.solid_line, show_label = true }
hline{F236, '0.236', Fcolor, 1, Foffset, style.solid_line, show_label = true }
hline{F382, '0.382', Fcolor, 1, Foffset, style.solid_line, show_label = true }
hline{F500, '0.5', Fcolor, 2, Foffset, style.solid_line, show_label = true }
hline{F618, '0.618', Fcolor, 1, Foffset, style.solid_line, show_label = true }
hline{F786, '0.764', Fcolor, 1, Foffset, style.solid_line, show_label = true }
hline{F1000, '1', Fcolor, 2, Foffset, style.solid_line, show_label = true }
--hline{F1618, '1.618', Fcolor, 3, Foffset, style.solid_line, show_label = true }

