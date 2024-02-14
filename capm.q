//CAPM - Capital Asset Pricing Model
// At the core, it sugggests that rewards and risk are highly correlated
// In order to gain high rewards one must accumulate high risk assets

// Beta is measure of how much risk the investment will add to a portfolio
/ The beta of a potential investment is a measure of how much risk the investment will add to a 
/ portfolio that looks like the market. If a stock is riskier than the market, it will have a beta greater than one. 
/ If a stock has a beta of less than one, the formula assumes it will reduce the risk of a portfolio.

// CAPM Formula - ERi = Rf + B(ERm - Rf)
// where ERi - Expected return on investment
/ Rf - Risk free govt treasury rate like 10Y UST
/ B - Beta of the investment
/ (ERm-Rf) - market risk premium
/ ERm - Return on Market like S&P 500 Index

// Beta Formula
/ B = Cov(Re, Rm) % Var(Rm)
/ Re = the return on an individual stock
/ Rm - the return on the overall market
/ Cov - How changes in a stock returns are related to changes in the market'sreturns
/ Var - How far the market's data points spread out from their average value
/ BETA SHOULD BE CALCULATED ON DOD PERCENTAGE CHANGE

sbi: ("DF";enlist csv) 0:hsym `$"/Users/utsav/Downloads/sbi.csv";
sensex: `date xdesc ("DF";enlist csv) 0:hsym `$"/Users/utsav/Downloads/sensex.csv";
nifty: `date xdesc ("DF";enlist csv) 0:hsym `$"/Users/utsav/Downloads/nifty.csv";
hdfc: `date xdesc ("DF";enlist csv) 0:hsym `$"/Users/utsav/Downloads/hdfc.csv";
sensex: select sensexPx:max[sensex]-min[sensex] by date.month from sensex;
res:sensex ij 1!sbi;
mpct:{100*(1_deltas x)%-1_x};
sensexPC:mpct res`sensex;
niftyPC:mpct res`nifty;
sbiPC:mpct res`sbi;
beta:{[eqindex;ticker] scov[eqindex;ticker]%svar eqindex};
capm:{[Rf;Rm;beta] Rf+beta*Rm-Rf};