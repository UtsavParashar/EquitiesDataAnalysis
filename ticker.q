//BSE Data
/ historical data
hd:.Q.id update "D"$($:)Date from ("Sffffffffffff";(,)",")
    0:`:/Users/utsav/Downloads/titan.csv; /- historical Data

/ Min/Max historical data by month
nhd:select from
    (update my:`month$Date, md:5_'($) Date from hd)
        where ClosePrice=(min;ClosePrice) fby my;

/ Data with max lowest price
obyDate:select count i by md from nhd;

day:(0;1;2;3;4;5;6)!`Sat`Sun`Mon`Tue`Wed`Thu`Fri;

/Day with max lowest price
obyDay:select count i by da from update da:day[Date mod 7] from nhd;


//- correlations between different fields
hd[`ClosePrice] cor hd`DeliverableQuantity
hd[`ClosePrice] cor hd`NoofShares