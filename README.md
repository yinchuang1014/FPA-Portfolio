Welcome to my professional repository. This space showcases the intersection of corporate finance controllership, forward-looking driver-based forecasting, and large-scale data integrity validation.

---

## 📊 Project 1: 24-Month Driver-Based SaaS Financial Model

### Executive Summary
This project houses an institutional-grade, multi-scenario corporate financial model built completely from scratch for **ApexMetrics SaaS**—an enterprise subscription software platform. 

The core objective of this project is to demonstrate advanced **Financial Planning & Analysis (FP&A)** methodologies, forward-looking driver-based forecasting, and rigorous 3-statement financial integration. The model is structurally optimized to address two critical core software metrics:
*   **Variable Cloud Infrastructure Unit-Cost Optimization:** Implements dynamic, resource-based variable costing structures to map cloud hosting outlays directly to scaling data storage thresholds.
*   **Working Capital Cash Velocity Acceleration:** Models the balance sheet efficiencies and liquidity unlocked by eliminating manual bank reconciliation loops and compressing accounts receivable collection cycles.


### Workbook Structure 
*  **`Dashboard`:** Premium visual interface tracking ARR growth curves, margins, and conditional runway indicators.
*  **`Scenario analysis`:** High-level summary isolating Base, Upside, and Downside outcomes side-by-side.
*  **`Budget vs. actual variance analysis`:** Mid-horizon tracking comparing frozen budgets against actual results with delta evaluations ($\Delta$ and %).
*  **`Integrated 3-statement model`:** Dynamic, indirect accounting core; the Balance Sheet dynamically self-balances to exactly `$0.00`.
*  **`Inputs & driver`:** Centralized control room utilizing `=CHOOSE()` functions tied to a cell `C4` master toggle.
*  **`Revenue schedule`:** Sub-ledger tracking customer cascades, monthly recurring revenue (MRR), and annualized run-rates (ARR).
*  **`Variable AWS Cloud COGS`:** Hosting cost calculation engine leveraging approximate-match tiered logic.
*  **`Expense schedule`:** Personnel overhead schedules deploying automated, periodic step-function merit adjustments.
*  **`Bank fee & working capital optimization schedule`:** Chronological aging tool tracking cash acceleration.

### File Directory
`ApexMetrics_SaaS_24Mo_Forecasting_Model.xlsx`

---
## 🗄️ Project 2: Enterprise Data Cleaning & Transformation (SQL)
* **Objective:** Executed an intensive data cleaning and restructuring program on a raw housing dataset of over 50,000 records to ensure data integrity and structural accuracy.
* **Core Technical Functions:** Utilized `SELECT`, `FROM`, `JOIN ON`, `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY` to filter, aggregate, and isolate systemic data anomalies.
* **Advanced Data Restructuring:** 
  * Implemented **Common Table Expressions (CTEs)** alongside window functions (`ROW_NUMBER`) to identify and purge duplicate records.
  * Executed schema modifications using `ALTER TABLE` and `UPDATE` commands to normalize raw strings.
  * Leveraged `PARSENAME` and `REPLACE` string functions to split unformatted, delimited address fields into clean, relational atomic columns.
* **File Directory:** `Nashville_Housing_Data_Cleaning_and_Transformation.sql`

---
## ⚡ Project 3: Western Wholesale Power Price Dashboard (Power BI)
### Executive Summary
A 3-page Power BI report built on **9 years (2017–2025) of public wholesale electricity and natural gas prices** from the U.S. Energy Information Administration (EIA/ICE), covering three Western trading hubs: Mid-C (Northwest), SP-15 (Southern California) and Palo Verde (Southwest).

The project demonstrates the full reporting cycle an FP&A analyst owns: preparing and validating raw data, modelling it, explaining what drives results, and reconciling a revenue variance to plan.
*   **Driver analysis:** Separates gas-driven price moves (the 2022 run-up) from non-gas moves (Mid-C's 2023–24 spikes, when the implied heat rate roughly doubled).
*   **Price/volume variance bridge:** Splits plan-vs-actual revenue for an illustrative Mid-C sales book into price and volume effects, month by month, with a control that proves the split ties to the total variance ($0 difference every year).

### Key Findings
*   Mid-C went from usually the cheapest of the three hubs (2017–2020) to the most expensive since 2023.
*   Peak monthly price: Mid-C **$275.62/MWh in December 2022**.
*   2025 (illustrative book): revenue **$8.5M (23.8%) below plan**, almost entirely from January, where the prior-year plan price carried over the January 2024 spike.
### Technical Work
*   **Power Query:** Combined 9 yearly files with inconsistent sheet names; excluded 376 empty rows and one thinly traded hub (NP-15); removed 3 duplicate deals that appeared in two yearly files. **Final dataset: 6,449 rows** plus 2,258 daily gas prices.
*   **Data model:** Star schema with a marked date table, hub dimension and single-direction relationships.
*   **DAX:** 23 measures, including year-over-year change, volatility, implied heat rate, regional spread and month-by-month price/volume variance.
*   **Controls:** Spot-checked Power BI results against the source file (Jan 2024 Mid-C: $216.47 in both) and kept a hidden reconciliation page.
*   **Documentation:** Business requirements document covering users, questions, sources, metric definitions, assumptions and data-quality results.
### File Directory
[`powerbi-wholesale-power/`](powerbi-wholesale-power/): report (`.pbix`), screenshots, illustrative plan data and the [business requirements document](powerbi-wholesale-power/docs/business_requirements.md)

---
### 📬 Contact & Professional Credentials
* **Designation:** Chartered Professional Accountant (CPA Candidate, 2026)
* **Location:** Vancouver, BC
* **Connect:** [www.linkedin.com/in/cy3066901156]
