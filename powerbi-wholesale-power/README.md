# Western Wholesale Power Price Dashboard (Power BI)

A 3-page Power BI report on **9 years (2017–2025) of public wholesale electricity and natural gas prices** for three Western U.S. trading hubs: Mid-C (Northwest), SP-15 (Southern California) and Palo Verde (Southwest). It shows how prices moved, what drove them, and how price and volume flow through to revenue against plan.

Data: U.S. Energy Information Administration (EIA), republished from ICE. Page 3 uses illustrative sales volumes; all prices are real.

**Author:** Chuang Yin, CPA · [LinkedIn](https://www.linkedin.com/in/cy3066901156/)

---

## Report pages

### 1. Overview: how have prices moved?
![Overview](docs/overview.png)

### 2. Drivers: what moves Mid-C prices?
![Drivers](docs/drivers.png)

### 3. Variance: why did revenue differ from plan?
![Variance](docs/variance.png)

## Key findings

- **Prices were calm until 2020, then spiked repeatedly.** The highest monthly average was Mid-C at **$275.62/MWh in December 2022**. Mid-C had a second spike of **$216.47 in January 2024**.
- **Mid-C reversed position against the other hubs.** It was usually the cheapest of the three before 2021 (2017, 2018, 2020), and it has been the most expensive since 2023 (2024: Mid-C $61.52 vs SP-15 $31.01).
- **Gas drove the 2022 run-up; Mid-C's 2023–24 spikes came while gas was cheap.** The implied heat rate (power price ÷ gas price) roughly doubled in 2023–24 compared with other years, so power was expensive for reasons other than gas.
- **A typical year at Mid-C** is cheapest in May–June and most expensive in winter and August.
- **2025 variance (illustrative book):** revenue was **$8.5M (23.8%) below plan**. Almost the entire −$7.8M price effect came from **January**, where the prior-year plan price carried over the January 2024 spike ($216/MWh vs $56 actual). Volume was 0.6% below plan (−$0.7M). Takeaway: a prior-year price plan breaks after an extreme month.

## What I did

| Step | Detail |
| --- | --- |
| **Data preparation (Power Query)** | Combined 9 yearly EIA files whose sheet names differ by year (`Source{0}[Data]`); renamed and typed columns; filtered to the Western hubs; added hub and region labels |
| **Data quality** | Excluded 376 empty rows; excluded NP-15 (only 37–99 trading days a year); removed 3 duplicate deals that appeared in two yearly files; kept 5 same-day pairs with different delivery periods. **Final: 6,449 rows**, plus 2,258 daily gas prices |
| **Data model** | Star schema: 3 fact tables, a marked date table and a hub dimension; single-direction relationships; join columns hidden |
| **DAX** | 23 measures, including year-over-year change, volatility, implied heat rate, regional spread, and a price/volume revenue bridge calculated month by month |
| **Controls** | `Variance Check` measure proves price + volume effects equal the total variance ($0 for every year); Jan 2024 Mid-C average spot-checked against the source file ($216.47 in both) |
| **Reporting** | Chart titles state findings; written commentary on the Drivers and Variance pages; hidden Tests page for reconciliation |
| **Documentation** | [Business requirements document](docs/business_requirements.md): users, questions, sources, metric definitions, assumptions, data-quality results, refresh steps |

![Data model](docs/data_model.png)

## Price/volume variance method

For each month:

- **Price effect** = (actual price − plan price) × actual volume
- **Volume effect** = (actual volume − plan volume) × plan price
- **Check:** price effect + volume effect = actual revenue − plan revenue

Plan price = Mid-C price in the same month of the prior year, so the variance analysis covers 2018–2025.

## Repository contents

```
powerbi-wholesale-power/
├── report/wholesale_power_dashboard.pbix
├── data/reference/plan_illustrative.xlsx
└── docs/
    ├── business_requirements.md
    ├── overview.png
    ├── drivers.png
    ├── variance.png
    └── data_model.png
```

Raw data files are not stored here. Download them from the sources below (files used: `ice_electric-2017final.xlsx` to `ice_electric-2025final.xlsx`, and Henry Hub daily spot prices, downloaded Nov 7, 2026).

## How to open

1. Download `report/wholesale_power_dashboard.pbix`.
2. Open it in [Power BI Desktop](https://www.microsoft.com/power-platform/products/power-bi/desktop) (free, Windows).
3. The Overview and Variance pages open on 2025 and share one Year slicer: it changes the Overview KPI cards and the whole Variance page, while the Overview trend charts always show 2017–2025. The Drivers page has its own Year slicer, set to All years.

## Limitations

Daily peak day-ahead prices only (no hourly or forward prices); prices dated by trade date; Henry Hub is a national gas benchmark because EIA's Northwest gas hub data ends in 2017; sales volumes on the Variance page are illustrative. The report shows *what* moved prices; causes such as hydro conditions or weather would need outside sources.

## Sources

- [EIA – Wholesale Electricity and Natural Gas Market Data](https://www.eia.gov/electricity/wholesale) (ICE data republished by EIA)
- [EIA – Henry Hub Natural Gas Spot Price](https://www.eia.gov/dnav/ng/hist/rngwhhdm.htm)
