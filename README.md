Welcome to my professional repository. This space showcases the intersection of corporate finance controllership, forward-looking driver-based forecasting, and large-scale data integrity validation.

---

## 📊 Project 1: 24-Month Driver-Based SaaS Financial Model

![Excel](https://shields.io)
![Financial Modeling](https://shields.io)
![Status](https://shields.io)

## 🏢 Executive Project Abstract
This repository houses an institutional-grade, multi-scenario corporate financial model built completely from scratch for **ApexMetrics SaaS**—an enterprise subscription software platform. 

The core objective of this project is to demonstrate advanced **Financial Planning & Analysis (FP&A)** methodologies, forward-looking driver-based forecasting, and rigorous 3-statement financial integration. The model is structurally optimized to address two critical core software metrics:
*   **Variable Cloud Infrastructure Unit-Cost Optimization:** Implements dynamic, resource-based variable costing structures to map cloud hosting outlays directly to scaling data storage thresholds.
*   **Working Capital Cash Velocity Acceleration:** Models the balance sheet efficiencies and liquidity unlocked by eliminating manual bank reconciliation loops and compressing accounts receivable collection cycles.

---

## 🗂️ Workbook Presentation Architecture (Exact Tab Order)

The workbook features a clean separation between presentation outputs, strategic testing tools, and foundational calculation sub-ledgers. Per corporate standards, presentation sheets hide gridlines for user-interface cleanliness, while all calculation engines retain visible gridlines to ensure rapid formula auditing (`Ctrl + [`) and error-tracking.

The workbook is packaged horizontally across a rolling 24-month horizon (Columns E to AB) using your exact final workbook sequence:

### 1. `📈 Dashboard`
*   **Financial Purpose:** Serves as the primary C-suite visual reporting interface. 
*   **Core Deliverables:** Displays critical SaaS performance health metrics including Annualized Run-Rate (ARR) growth trajectories, gross margin contraction curves, and conditional color-coded cash runway status alerts. (Gridlines hidden for executive presentation).

### 2. `🎛️ Scenario analysis`
*   **Financial Purpose:** Isolates the high-level financial impacts of different macroeconomic corporate states side-by-side.
*   **Core Deliverables:** Summarizes top-line expansion and bottom-line free cash flows, allowing executives to contrast organizational resilience across Base, Upside, and Downside outcomes instantly. (Gridlines hidden for summary cleanliness).

### 3. `⚖️ Budget vs. actual variance analysis`
*   **Financial Purpose:** Merges historical monthly "Actuals" against the frozen operational budget to run variance analyses.
*   **Core Deliverables:** Calculates absolute dollar ($\Delta$) and percentage ($\%$) deltas. Features professional variance narrative commentary explaining infrastructure margin slips and working capital velocity freedoms. (Gridlines visible for analytical audit).

### 4. `📑 Integrated 3-statement model`
*   **Financial Purpose:** The core accounting and financial engine of the organization.
*   **Core Deliverables:** Houses a fully integrated Income Statement, Balance Sheet, and Cash Flow Statement using the indirect method. The Balance Sheet dynamically binds and self-balances to exactly `$0.00` across all Period columns based on ending cash flows. (Gridlines visible for balancing trace).

### 5. `⚙️ Inputs & driver`
*   **Financial Purpose:** The centralized control room of the entire forecasting engine.
*   **Core Deliverables:** Isolates all hardcoded inputs (styled in standard corporate blue font). Houses the master `Active_Scenario_Toggle` drop-down menu in cell `C4`, which triggers embedded `=CHOOSE()` functions across the entire workbook to instantaneously re-project all sheets. (Gridlines visible for database inputs).

### 6. `📊 Revenue schedule`
*   **Financial Purpose:** The top-line revenue waterfall sub-ledger.
*   **Core Deliverables:** Tracks beginning customer cohorts, monthly new customer additions, and rounded logo attritions (`-ROUND()`) to establish clean cascades for Monthly Recurring Revenue (MRR) and ARR. (Gridlines visible for cohort tracing).

### 7. `☁️ Variable AWS Cloud COGS`
*   **Financial Purpose:** Models resource-based variable infrastructure hosting economics.
*   **Core Deliverables:** Leverages an approximate-match `=VLOOKUP(..., TRUE)` pricing reference matrix to simulate tiered data storage volume discounts ($0.020/GB down to $0.012/GB), mapping storage thresholds and compute overhead directly to scaling user volume. (Gridlines visible for tier verification).

### 8. `👥 Expense schedule`
*   **Financial Purpose:** Maps organizational operating expenses (OpEx) and headcount growth.
*   **Core Deliverables:** Models department salary splits (R&D, S&M, G&A) alongside an exponential step-function formula `=INT((Month-1)/12)` to dynamically compound and inject merit raises exactly once every 12 months on a rolling horizontal timeline. (Gridlines visible for headcount alignment).

### 9. `🏦 Bank fee & working capital optimization schedule`
*   **Financial Purpose:** Evaluates working capital velocity and cash collections lag.
*   **Core Deliverables:** Quantifies the structural cash flow variance created by swapping unoptimized manual ledger posting (45-day collection delay) with automated bank-feed matching (15-day collection delay). (Gridlines visible for invoice aging tracking).

---

## 🎚️ Scenario Matrix & Strategic Deliverables

Through cell `C4` driver manipulation, the model projects three highly distinct operational outcomes, altering corporate survival metrics:

| Metric (Month 1 Metrics) | 📉 Downside Case Scenario | 📊 Base Case Scenario | 🚀 Upside Case Scenario |
| :--- | :--- | :--- | :--- |
| **Active Scenario Toggle** | `3` | `1` | `2` |
| **New Customer Logos / Mo**| 10 Logos | 25 Logos | 45 Logos |
| **Monthly Logo Churn Rate** | 4.5% | 2.0% | 1.0% |
| **Average Revenue Per User**| \$180 / month | \$200 / month | \$220 / month |
| **Cloud Blended Unit Cost** | \$0.015 / GB | \$0.012 / GB | \$0.012 / GB |
| **Total Month 1 Revenue** | \$87,660 | \$103,000 | \$118,800 |
| **Total Month 1 Cloud COGS**| \$913 | \$927 | \$1,215 |
| **Calculated Gross Margin** | **98.96%** | **99.10%** | **98.98%** |
| **Cash Runway Status** | **Healthy (33.5 Months)** | **Healthy (75.5 Months)** | **Cash Generative (Infinite)** |

### 🚀 Strategic Scenario Notes
*   **The Upside Growth Paradox:** While the Upside Case generates massive absolute gross profit dollars (\$117,585), its calculated Gross Margin (98.98%) is slightly lower than the Base Case (99.10%). This is a realistic reflection of software scaling limitations: customer data-storage allocation grew aggressively by 25% (120GB to 150GB), while top-line contract value (ARPU) only expanded by 10% (\$200 to \$220), outstripping fixed bulk discount tiers.
*   **Working Capital Efficiency:** In the Base Case, deploying automated bank-feed matching contracts accounts receivable processing lag down to 15 days. This locks in an exceptional **75.5 months of operational runway (6.3 years)**, eliminating the need to take on dilutive credit facilities to fund corporate expansion.

---

## 🧽 Model Sanitation & Governance
This file has been fully audited, vetted, and sanitized using the Excel Document Inspector. All metadata, absolute local file paths, personal author information, and active task-pane history cache tracks from built-in AI assistant tools have been completely removed to maintain professional corporate compliance and security protocols.


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
### 📬 Contact & Professional Credentials
* **Designation:** Chartered Professional Accountant (CPA Candidate, 2026)
* **Location:** Vancouver, BC
* **Connect:** [www.linkedin.com/in/cy3066901156]
