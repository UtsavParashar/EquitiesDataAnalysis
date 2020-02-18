// Sensex data from yahoo --> Public Data source https://finance.yahoo.com/quote/%5EBSESN/history/
dd:((!)7)!`Sat`Sun`Mon`Tue`Wed`Thu`Fri; /- day dictionary
/ historical data
hd:.Q.id update "D"$($:)Date from ("Sfffff";(,)",") 0:`:/Users/utsav/Downloads/sensex.csv;
hd: update yr:`year$Date, my:`month$Date, md:5_'($) Date, we:7 xbar' Date from hd;
/ Data with max lowest price
select count i by md from hd;
/ Day with max lowest price in year/month/date
gds:{   /- get Day wise stats
    inf:{
            `cou xdesc select cou:count i by da from update da:dd[Date mod 7] from
                select from hd where Close=(min;Close) fby x
        };
    :$[`year=x; inf[hd`yr];
      `month=x; inf[hd`my];
      `week=x; inf[hd`we];
      '"Provide year, month or week as arg";
      ]

 };

//- Test
gds[`week]
