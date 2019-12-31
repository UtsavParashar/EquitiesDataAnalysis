
//BSE Data
dd:((!)7)!`Sat`Sun`Mon`Tue`Wed`Thu`Fri; /- day dictionary
/ historical data
hd:.Q.id update "D"$($:)Date from ("Sffffffffffff";(,)",")
    0:`:/Users/utsav/Downloads/sunt.csv; /- historical Data
hdf: update yr:`year$Date, my:`month$Date, md:5_'($) Date, we:7 xbar' Date from hd; /- historic data for gds function

gds:{   /- get Day wise stats
    inf:{
            `cou xdesc select cou:count i by da from update da:dd[Date mod 7] from
                select from hdf where ClosePrice=(min;ClosePrice) fby x
        };
    :$[`year=x; inf[hdf`yr];
      `month=x; inf[hdf`my];
      `week=x; inf[hdf`we];
      '"Provide year, month or week as arg";
      ]

 };

//- Test
gds[`week]



//- correlations between different fields
hd[`ClosePrice] cor hd`DeliverableQuantity
hd[`ClosePrice] cor hd`NoofShares



//- Test For Extreme cases
/ Min/Max historical data by month
nhd:select from
    (update my:`month$Date, md:5_'($) Date from hd)
        where ClosePrice=(min;ClosePrice) fby my;

/ Data with max lowest price
obyDate:select count i by md from nhd;

day:(0;1;2;3;4;5;6)!`Sat`Sun`Mon`Tue`Wed`Thu`Fri;

/Day with max lowest price
obyDay:select count i by da from update da:day[Date mod 7] from nhd;


//- Lom - monday
//- ham - mon, fri
//- irc - fri
//- kot - mon, fri
//- sunt - mon, fri