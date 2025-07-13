# Final-Project

This is a repository for a final project





\# 🛒 Online Sales Data Analysis \& Visualization



This Python script performs a complete \*\*data wrangling, cleansing, and exploratory data analysis (EDA)\*\* on an online sales dataset. The process prepares the data for downstream business intelligence tools such as Tableau and enables meaningful business insights through visualizations.

This project performs hypothesis testing using statistical methods to uncover insights in e-commerce transactional data. The primary focus is on analyzing sales channels, discounts, country-based purchase behaviors, and product category discounts.



---

\## Table of Contents



1\. \[Overview](#overview)

2\. \[Data Cleaning and Wrangling]

3\. \[Exploratory Data Analysis EDA]

4\. \[Hypotheses](#hypotheses)

5\. \[Setup Instructions](#setup-instructions)

6\. \[Analysis Workflow](#analysis-workflow)

7\. \[Results Interpretation](#results-interpretation)

8\. \[Visualization](#visualization)

9\. \[Presentation](#presentation)

10\. \[Dependencies](#dependencies)





\## 📁 Dataset



\- \*\*Input\*\*: `online\_sales\_dataset.xlsx`

\- \*\*Output\*\*: `onlinesales\_dataset.csv`

\- Contains transactional data including invoice details, customer information, product metadata, payment methods, shipping costs, and sales channels.



---



\## 🧱 Features Covered



\### 🔹 Data Cleaning \& Preprocessing

\- Loads `.xlsx` data into a pandas DataFrame

\- Standardizes column names to `snake\_case`

\- Handles missing values:

&nbsp; - Uses `IterativeImputer` to fill in missing `customer\_id`s

&nbsp; - Fills missing `warehouse\_location` by mapping from country

&nbsp; - Replaces missing `shipping\_cost` with column mean

\- Converts data types (e.g., `customer\_id` to integer)

\- Extracts time-based features: `year`, `month`, `quarter`, `day\_of\_week`, `week`



\### 🔹 Feature Engineering

\- Creates derived columns such as:

&nbsp; - `Total Revenue = Quantity × Unit Price`

&nbsp; - Time aggregations for trend analysis



\### 🔹 Data Export

\- Final cleaned dataset is exported to: `onlinesales\_dataset.csv`



---



\## 📊 Exploratory Data Analysis (EDA)



\### 🧪 1. Distribution Analysis

\- Generates histograms for all numeric columns



\### 📈 2. Sales Trends

\- Line chart: Monthly sales over time



\### 📦 3. Product Analysis

\- Top 10 products by quantity sold

\- Distribution of unit prices



\### 🌍 4. Geographic Insights

\- Top countries by sales volume



\### 💳 5. Payment \& Shipping

\- Frequency of payment methods

\- Boxplot of shipping cost per payment type



\### 🔁 6. Correlation Matrix

\- Pearson correlation heatmap for numerical features



\### 📉 7. Quantity vs. Unit Price

\- Scatter plot to visualize pricing patterns by quantity



\## Hypotheses



1\. \*\*Sales Channel and Revenue\*\*: Sales through specific `sales\_channel` generate higher revenue.

2\. \*\*Discounts and Quantity Purchased\*\*: Higher discounts lead to an increase in quantity purchased.

3\. \*\*Country and Average Order Value\*\*: Orders from certain countries have higher average order values.

4\. \*\*Category and Average Discount\*\*: Certain product categories receive higher average discounts.



---



\## Setup Instructions



1\. Clone the repository or download the script.

2\. Ensure you have Python 3.x installed.

3\. Install dependencies using pip:

&nbsp;  ```bash

&nbsp;  pip install pandas numpy matplotlib seaborn scipy

&nbsp;  ```

4\. Load your dataset and ensure it includes columns like: `unit\_price`, `quantity`, `discount`, `sales\_channel`, `country`, and `category`.



---



\## Analysis Workflow



Each hypothesis is tested using a corresponding function:



\### 1. Revenue Calculation



```python

calculate\_revenue(df)

```

Adds a `revenue` column to your dataset.



---



\### 2. Compare Sales Channels



```python

compare\_sales\_channels(df, channel1='Online', channel2='In-store')

```

Performs Welch’s t-test to evaluate revenue differences between sales channels.



---



\### 3. Discount vs Quantity Purchased



```python

test\_discount\_quantity\_hypothesis(df, discount\_threshold=0.2)

```

Evaluates if customers purchase more with higher discounts.



---



\### 4. Country Order Values



```python

test\_country\_order\_values(df, top\_n=10)

```

Performs pairwise t-tests between top countries based on order volume.



---



\### 5. Category vs Discount



```python

\# Aggregated average discount by category

df.groupby('category')\['discount'].mean()

```

Plus pairwise t-tests using `ttest\_ind` to evaluate category-level discount differences.



---



\## Results Interpretation



\- For each test, significance is determined using p-values with α = 0.05.

\- Effect sizes (Cohen’s d) are computed where applicable.

\- Each function returns an interpretation summary indicating whether the hypothesis is supported.



---



\## Visualization



Each hypothesis includes visualizations such as:



\- \*\*Barplots\*\* for revenue or average values

\- \*\*Boxplots\*\* for distributions

\- \*\*Scatter plots\*\* for discount vs quantity relationships



These visualizations help in understanding the underlying patterns in the data.



---



\## Presentation



A summarized Prezi presentation is available here:  

\[📊 View the Presentation](https://prezi.com/p/edit/7pvuqkvlg6j3/)



---



\## Author

Chika Ikenna Umeh

umehchikaikenna@gmail.com

https://github.com/Ccika90



---



\## Dependencies



\- pandas

\- numpy

\- matplotlib

\- seaborn

\- scipy





\## 🧪 Dependencies



Install the required packages with:



```bash

pip install pandas numpy matplotlib seaborn scikit-learn openpyxl

```



---



\## 🚀 How to Run



```bash

python eda\_script.py

```



Ensure `online\_sales\_dataset.xlsx` is present in the same directory.



---



\## 📦 Output Files



\- `onlinesales\_dataset.csv`: Cleaned, transformed dataset

\- Multiple plots displayed interactively via `matplotlib` and `seaborn`



---



\## ✅ Use Cases



\- Dashboard creation in Tableau or Power BI

\- Sales and marketing analysis

\- Inventory \& demand forecasting

\- Customer segmentation



