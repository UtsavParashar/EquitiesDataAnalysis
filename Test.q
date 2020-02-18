/- Function to get the csv data from BSE format to kdb format
/- Input Parameters - similar to .Q.en
/- x -> Directory
/- y -> table
getTickerDataFromCSV:{.Q.id update "D"$($:)Date from ("Sffffffffffff";(,)",")
     0:hsym`$x,($:)y};

/- Test getTickerDataFromCSV["/Users/utsav/Downloads/";`ufo.csv]
/- data:getTickerDataFromCSV["/Users/utsav/Downloads/";`539141.csv]
/- 1_deltas data`ClosePrice
