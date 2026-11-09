# Business Requirements – Western Wholesale Power Price Dashboard

**Author:** Chuang Yin, CPA  
**Version:** 1.0 – November 2026  
**Status:** Portfolio project built on public data. Page 3 uses illustrative sales volumes.

---

## 1. Purpose

Give finance and commercial teams one place to see how Western U.S. wholesale power prices have moved, what has driven them, and how price and volume changes flow through to revenue against plan.

## 2. Intended users (portfolio scenario)

| User | What they need | How often |
| --- | --- | --- |
| Financial / FP&A analysts | Monthly price trends, plan-vs-actual variance by driver, commentary-ready numbers | Monthly close, ad hoc |
| Trading-desk and commercial leads | Regional price comparison, spreads, link between power and gas | Weekly, ad hoc |
| Finance managers / senior leadership | Headline KPIs and a short explanation of what drove results | Monthly, quarterly |

## 3. Business questions

1. How have Western hub power prices moved by month and year (2017–2025)?
2. What drives Mid-C prices: natural gas, season, or regional conditions compared with other hubs?
3. Why did revenue differ from plan, and how much was price versus volume? *(illustrative sales book)*

## 4. Report pages

| Page | Content | Answers |
| --- | --- | --- |
| Overview | KPI cards (average price, change vs prior year, volume traded, daily price volatility); monthly price by hub; annual price by hub; Mid-C month × year heat map | Q1 |
| Drivers | Mid-C vs Henry Hub gas; implied heat rate; SP-15 minus Mid-C spread; typical-year price profile; observations | Q2 |
| Variance | Plan vs actual KPIs; plan-to-actual waterfall (price effect, volume effect); monthly variance table; commentary | Q3 |
| Tests (hidden) | Yearly reconciliation matrix, including Variance Check = 0 | Data assurance |

## 5. Data sources

| Source | Content | Granularity | Coverage | Refresh at source | Downloaded |
| --- | --- | --- | --- | --- | --- |
| [EIA – Wholesale Electricity and Natural Gas Market Data](https://www.eia.gov/electricity/wholesale) (republished from ICE) | Daily peak day-ahead power prices by hub: high, low, weighted average, volume, trades, counterparties | Daily, per hub | 2017–2025 (9 yearly files) | Biweekly | Nov 7, 2026 |
| [EIA – Henry Hub Natural Gas Spot Price](https://www.eia.gov/dnav/ng/hist/rngwhhdm.htm) | Daily Henry Hub spot gas price (USD/MMBtu) | Daily | 2017–2025 | Daily | Nov 7, 2026 |
| `plan_illustrative.xlsx` (author-built) | Planned and actual monthly sales volumes (MWh) for an imaginary Mid-C sales book | Monthly | 2018–2025 (96 months) | Manual | n/a |

## 6. Data model

Star schema, single-direction one-to-many relationships:

| Table | Type | Grain | Key |
| --- | --- | --- | --- |
| `Fact_power_prices` | Fact | One row per hub per trade date (per delivery period) | TradeDate, HubShort |
| `fact_gas_prices` | Fact | One row per day | Date |
| `plan_illustrative` | Fact (plan) | One row per month | MonthStart |
| `dim_date` | Dimension (marked date table) | One row per day, 2017–2025 | Date |
| `dim_hub` | Dimension | One row per hub (3) | HubShort |
| `bridge` | Disconnected helper | 3 rows (waterfall steps) | n/a |
| `_Measures` | Measure table | n/a | n/a |

Relationships: `dim_date[Date]` → `Fact_power_prices[TradeDate]`, `fact_gas_prices[Date]`, `plan_illustrative[MonthStart]`; `dim_hub[HubShort]` → `Fact_power_prices[HubShort]`. Join columns on fact tables are hidden from report view.

## 7. Metric definitions

| Metric | Definition | Plain English |
| --- | --- | --- |
| Avg Price | Average of daily weighted-average index prices | Typical daily price, $/MWh |
| VW Avg Price | Σ(price × volume) ÷ Σ volume | Price weighted by how much traded |
| Traded Volume MWh | Σ daily volume | Volume in the qualifying trades |
| Price YoY % | (Avg Price − prior-year Avg Price) ÷ prior-year Avg Price | Change vs same period last year; meaningful when one year is selected |
| Price Volatility | Standard deviation of daily index prices | How much daily prices swing, $/MWh |
| Avg Daily Range | Average of (daily high − daily low) | Intraday price spread |
| Mid-C Price / SP-15 Price | Avg Price for that hub | Hub-specific price |
| SP-15 minus Mid-C | SP-15 Price − Mid-C Price | Positive = Mid-C cheaper than Southern California |
| Henry Hub Price | Average daily Henry Hub spot price | Gas benchmark, $/MMBtu |
| Implied Heat Rate | Mid-C Price ÷ Henry Hub Price | Power price in "units of gas"; a jump means power is expensive for non-gas reasons |
| Plan Price | Mid-C Price for the same month of the prior year | Plan assumes last year's price |
| Plan / Actual Revenue | Σ by month of volume × price | Revenue of the illustrative book |
| Price Variance | Σ by month of (actual price − plan price) × actual volume | Revenue change caused by price |
| Volume Variance | Σ by month of (actual volume − plan volume) × plan price | Revenue change caused by volume |
| Total Variance | Actual Revenue − Plan Revenue | Total gap to plan |
| Variance Check | Total Variance − Price Variance − Volume Variance | Must equal 0 (reconciliation control) |

## 8. Business rules and assumptions

- Prices are **peak, day-ahead** index prices as published by EIA/ICE, in **USD**. No currency conversion.
- Prices are dated by **trade date**, not delivery date.
- Hubs in scope: **Mid-C (Northwest), SP-15 (Southern California), Palo Verde (Southwest)**.
- **NP-15 is excluded:** it has only 37–99 trading days per year in this data, against about 230–250 for the other hubs, too few for reliable daily or monthly averages.
- **Henry Hub** is used as the gas benchmark because EIA's Northwest gas hub data (Malin) is not published after 2017. It is a national price, not a Northwest one.
- Plan price = same month, prior year. The variance analysis therefore covers **2018–2025** (2017 has no prior year).
- Plan and actual **volumes are illustrative** (made up). Only the prices are real.

## 9. Data quality checks and results

| Check | Result |
| --- | --- |
| Files combined | 9 electricity files (2017–2025) via Power Query folder combine; first sheet used for each file, because sheet names differ by year |
| Empty rows | 376 rows with every field blank except the file name; excluded |
| Hub coverage per year | Mid-C 237–249, Palo Verde 237–249, SP-15 229–247 trading days; NP-15 37–99 (excluded) |
| Duplicates (hub + trade date + delivery start) | 3 true duplicates removed: year-end deals listed in both the trade-year and delivery-year files (e.g. Mid-C traded 12/31/2019 for 1/2/2020 delivery) |
| Same-day pairs kept | 5 hub/trade-date pairs with two rows each: separate deals for different delivery periods; kept |
| Final power dataset | **6,449 rows** (6,452 before duplicate removal) |
| Gas dataset | 2,258 daily rows, 2017–2025 |
| Plan dataset | 96 monthly rows, 2018–2025 |
| Data types | 0% errors in all columns after typing |
| Spot check vs source | Jan 2024 Mid-C average: Power BI $216.47 vs Excel `AVERAGEIFS` on source file $216.47: **matched** |
| Reconciliation | Variance Check = $0 for every year and in total |

## 10. Refresh and maintenance

1. Download the new yearly EIA electricity file into `data/raw/electricity/` and the updated Henry Hub file into `data/raw/gas/`. Do not edit raw files.
2. Extend the end date in `dim_date` (`CALENDAR`) and add the new months to `plan_illustrative.xlsx`.
3. **Refresh** in Power BI Desktop. Re-run the checks in section 9: hub row counts, duplicates, Variance Check = 0, one spot check.
4. Update chart titles and commentary to match the new data.

Owner: report author. Expected effort: under one hour per annual update.

## 11. Known limitations

- Daily peak index only: no hourly, off-peak or forward prices.
- Trade-date basis: a small number of deals traded at year-end belong to the next year's delivery.
- Henry Hub is a national gas price and does not capture Northwest gas conditions.
- The report shows **what** moved prices, not **why**. Causes such as hydro conditions or weather need outside sources before being stated.
- A prior-year price plan is fragile after an extreme month: in 2025, January alone explains almost the whole price variance because the plan copied the January 2024 spike.

## 12. Possible next steps

- Replace the prior-year plan price with a multi-year average or forward-curve price.
- Add Northwest hydro and weather indicators to explain the 2023–24 price behaviour.
- Add CAD conversion and Canadian market context.
- Automate refresh (e.g. scheduled download plus Power BI Service refresh).
