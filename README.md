# Contoso Advanced SQL Project
## Comprehensive Sales Analysis Framework

## Overview
This analysis examines customer behavior patterns, retention dynamics, and lifetime value (LTV) metrics for an e-commerce business. By leveraging historical transaction data, we identify strategic opportunities to optimize customer retention and maximize revenue generation. The methodology combines **quantitative segmentation**, **temporal cohort tracking**, and **churn prediction modeling** to develop actionable business strategies.

---

## Business Questions & Strategic Importance

### 1. Customer Segmentation: Who are our most valuable customers?
**Objective:** Identify high-potential customer groups for resource prioritization  
**Business Impact:** Enables precision marketing and ROI-focused loyalty programs

### 2. Cohort Analysis: How do customer groups generate revenue over time?
**Objective:** Understand longitudinal spending patterns across acquisition periods  
**Business Impact:** Reveals generational shifts in customer value and product/market fit

### 3. Retention Analysis: Which customers are at risk of churn?
**Objective:** Predict and prevent customer attrition  
**Business Impact:** Reduces revenue leakage and increases CLV (Customer Lifetime Value)

---

## Deep Dive: Analysis Approach & Insights

### 1. Customer Segmentation Analysis
**Methodology:**
- Calculated Net Revenue Per Customer (12-month rolling)
- Applied RFM (Recency-Frequency-Monetary) scoring
- Segmented using percentile splits (Top 25% = High, Next 50% = Mid, Bottom 25% = Low)

**🖥️ Query:** [Customer Segmentation Analysis](/1_Customer_Segmentation.sql)

**📈 Visualization:**

![Customer Segmentation](/Images/Customer%20Segmentation%20.png)


**Strategic Recommendations:**

| Segment      | Tactical Actions                                | Expected Outcome                               |
|--------------|------------------------------------------------|-----------------------------------------------|
| High-Value  | - Dedicated account managers<br>- Early-access to new products<br>- High-touch retention programs | Reduce churn by 15-20% in VIP segment         |
| Mid-Value   | - Tiered loyalty program<br>- Cross-sell bundles<br>- Predictive upsell triggers | Convert 20% to High-Value segment within 18mo |
| Low-Value   | - Automated win-back campaigns<br>- Micro-incentives for repeat purchases<br>- Cost-efficient engagement channels | Increase purchase frequency 2.5x              |

**⚠️ Critical Insight:** The high-value segment (12.3k customers) represents disproportionate revenue concentration - losing just 5% of this group equals losing 3.3% of total revenue.

### 2. Cohort Analysis
**Methodology:**

- Grouped customers by acquisition year (2016-2024 cohorts)

- Tracked revenue per cohort

- Normalized by active customer count

**🖥️ Query:** [Cohort Analysis](/2_Cohort_Analysis.sql)

**📈 Visualization:**

![Cohort Analysis](/Images/Cohort%20Analysis.png)

**Key Findings Explained:**

- Revenue Dilution: New cohorts spend 40% less than 2016-2018 cohorts despite inflation

- Acquisition Quality: 2023 saw 18% fewer new customers than 2022

- Hidden Risk: Overall revenue growth is sustained by volume, masking declining per-customer value

**Root Cause Hypotheses:**

- Market saturation in core demographics

- Increased competitor price aggression

- Product-market fit erosion in new customer segments

### 3. Retention Analysis

**Methodology:**

- Defined churn: 180+ days without purchase

- Calculated cohort survival curves

- Identified churn predictors using logistic regression


**🖥️ Query:** [Retention  Analysis.sql](/3_Retention_Analysis.sql)

**📈 Visualization:**

![Retention  Analysis](/Images/Retention%20%20Analysis%20.png)

**⚠️Critical Observations:**

- 90% churn occurs within 36 months across all cohorts

- No significant improvement in retention since 2016

- High-value customers churn at same rate as others (missed opportunity)

**Intervention Framework:**

![Intervention Framework](/Images/Intervention%20Framework.png)

### Strategic Roadmap
**Phase 1: Quick Wins (0-3 Months)**

- VIP Program Launch: Target top 12,372 customers with concierge service

- Cohort-Specific Promotions: Reactivate 2022-2024 cohorts with time-limited offers

- Automated Churn Alerts: Implement real-time risk scoring in CRM

**Phase 2: Systemic Fixes (3-6 Months)**

- Product-Gap Analysis: Investigate value decline in new cohorts

- Pricing Strategy Review: Develop segment-specific price tiers

- Predictive Modeling: Build LTV forecasting dashboard

**Phase 3: Long-Term Plays (6-12 Months)**

- Subscription Program: Convert 20% of high-value segment to recurring revenue

- Customer Journey Remapping: Reduce friction points in post-purchase experience


# Technical Implementation


| Component           | Tools                          | Key Outputs                          |
|---------------------|--------------------------------|--------------------------------------|
| Data Extraction     | PostgreSQL     | Cleaned customer transaction tables |
| Analysis           | DBeaver, PGadmin, PostgreSQL           | Cohort tables, RFM scores, Churn flags |
| Visualization      | Excel              | Interactive retention dashboards    |


## Conclusion & Strategic Imperatives
### Cross-Analysis Synthesis
**The investigation reveals three existential challenges:**

- Revenue Concentration Risk: 66% of revenue depends on just 12,372 customers

- Generational Value Decline: New customers spend 40% less than historical cohorts

- Systemic Retention Failure: 90% customer loss within 3 years across all segments

These findings indicate our growth model is unsustainable - we're acquiring lower-value customers while failing to retain high-value relationships. The 2023 acquisition decline suggests market forces are exacerbating these trends.

## Final Takeaways
1. Immediate Focus: Protect the high-value segment at all costs - a 5% reduction in VIP churn could yield $6.7M annual revenue preservation

2. Strategic Pivot: Shift from acquisition volume to value quality - solving the 40% cohort value decline is more impactful than increasing customer count

3. Retention Revolution: Our 90% churn rate represents a $180M recoverable opportunity - retention improvements will yield 3-5x ROI versus acquisition spending

4. Data-Driven Culture: Embed cohort analysis into all decision-making - what worked for 2016-2018 customers is ineffective for modern cohorts

**The Ultimate Metric:** Customer Lifetime Value must increase by 25% within 18 months to sustain profitability. This requires simultaneous optimization of:

- VIP retention rates

- Mid-value upgrade conversion

- Cohort revenue stabilization

- Churn reduction systems

**Final Strategic Imperative:** We must transition from transactional relationships to customer lifecycle management. The companies that win in the next decade won't have the most customers, but the most valuable customer relationships sustained over time.