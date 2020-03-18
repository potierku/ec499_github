
/* set working directory */
cd "C:\Users\Kurtis Potier\Documents\ec499_github"

clear
/*import country data, set cellrange to end of data*/
import excel using "Data.xlsx", sheet("ukraine") firstrow cellrange(:Z34)
/* set year as time series indicator*/
tsset year
/*create trend variable*/
gen trend= _n

/* static model, no lags, no transformations*/
reg gdp_growth gdp_cap unemployment inflation_cpi debt_gdp i_lend fdi_gdp capital_gdp labor_growth gdp_energy power_losses patents_100000 trend
outreg2 using ukraine_reg.xls, replace ctitle(linear_static)

/* lag model, no transformations */
reg gdp_growth gdp_cap unemployment inflation_cpi L4.debt_gdp L.i_lend fdi_gdp L.capital_gdp L2.labor_growth gdp_energy power_losses patents_100000 trend
outreg2 using ukraine_reg.xls, append ctitle(linear_lags)

/*no lags, transformations*/
/*gen log_inflation_cpi = log(inflation_cpi)*/
reg gdp_growth gdp_cap unemployment inflation_cpi debt_gdp i_lend fdi_gdp capital_gdp labor_growth gdp_energy power_losses patents_100000 trend
outreg2 using ukraine_reg.xls, append ctitle(transformations_static)

/*lag model, transformations*/
reg gdp_growth gdp_cap unemployment inflation_cpi L4.debt_gdp i_lend fdi_gdp capital_gdp labor_growth gdp_energy power_losses patents_100000 trend
outreg2 using ukraine_reg.xls, append ctitle(transformations_lags)
