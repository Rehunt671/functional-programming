----------------------------------------------- Day in month -----------------------------------------------
data Month = January | February | March | April | May | June | July | August | September | October | November | December
    deriving (Show)

daysInMonth :: Month -> Integer
daysInMonth month = case month of
    January   -> 31
    February  -> 28  
    March     -> 31
    April     -> 30
    May       -> 31
    June      -> 30
    July      -> 31
    August    -> 31
    September -> 30
    October   -> 31
    November  -> 30
    December  -> 31


----------------------------------------------- Next Day function-----------------------------------------------
nextDay :: Integer -> Month -> (Integer, Month)
nextDay day month = 
    let daysInCurrentMonth = daysInMonth month
    in if day < daysInCurrentMonth
       then (day + 1, month)
       else (1, nextMonth month)

nextMonth :: Month -> Month
nextMonth January = February
nextMonth February = March
nextMonth March = April
nextMonth April = May
nextMonth May = June
nextMonth June = July
nextMonth July = August
nextMonth August = September
nextMonth September = October
nextMonth October = November
nextMonth November = December
nextMonth December = January
