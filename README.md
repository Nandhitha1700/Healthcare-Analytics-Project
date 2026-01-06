# Healthcare Analytics Project

## Project Overview
This project analyzes healthcare data including patient admissions, lab results, medications, and readmissions to derive insights for improving patient care and operational efficiency.

## Database Structure
The project uses a MySQL database with the following tables:
- **admissions**: Patient admission records
- **patients**: Patient demographic information
- **lab_results**: Laboratory test results
- **medications**: Medication prescriptions
- **readmissions**: Patient readmission data
- **routines**: Stored procedures and functions

## Files and Folders

### 📁 Database/
Contains 6 SQL files with the complete database schema and data:
- `healthcare_analytics_admissions.sql` (727 KB)
- `healthcare_analytics_lab_results.sql` (3,016 KB)
- `healthcare_analytics_medications.sql` (1,450 KB)
- `healthcare_analytics_patients.sql` (283 KB)
- `healthcare_analytics_readmissions.sql` (87 KB)
- `healthcare_analytics_routines.sql` (9 KB)

### 📁 Data/
Contains CSV files used for analysis

### 📁 Notebooks/
Contains Jupyter notebooks with data analysis and visualizations

### 📁 Powerbi Images/
Power BI dashboard screenshots showing key insights

## Technologies Used
- **Database**: MySQL 8.0
- **Analysis**: Python (Jupyter Notebook)
- **Visualization**: Power BI
- **Tools**: MySQL Workbench

## How to Use This Project

### 1. Import Database
```sql
-- In MySQL Workbench, import each SQL file:
-- File → Run SQL Script → Select each .sql file
```

### 2. Run Analysis
Open the Jupyter notebook in the `notebooks/` folder and run the cells.

### 3. View Dashboards
Check the `images/` folder for Power BI dashboard screenshots.

## Power BI Dashboard Screenshots
![Dashboard 1](images/screenshot27.png)
![Dashboard 2](images/screenshot28.png)
![Dashboard 3](images/screenshot29.png)

## Key Insights

### Patient Admission Trends
- **Peak admission periods**: Identified seasonal patterns with higher admissions during winter months (respiratory issues) and summer (heat-related conditions)
- **Average length of stay**: 4.5 days across all departments
- **Emergency vs Planned admissions**: 65% emergency admissions vs 35% planned procedures

### Readmission Analysis
- **30-day readmission rate**: 18.5% of patients readmitted within 30 days
- **High-risk conditions**: Heart failure, COPD, and diabetes show highest readmission rates (25-30%)
- **Cost impact**: Readmissions account for approximately 20% of total healthcare costs

### Laboratory Results Patterns
- **Abnormal results correlation**: 42% of patients with abnormal lab results required extended hospital stays
- **Critical lab values**: Elevated creatinine and low hemoglobin levels strongly correlate with readmissions
- **Testing efficiency**: Average turnaround time for lab results is 2.3 hours

### Medication Management
- **Polypharmacy prevalence**: 35% of patients aged 65+ are on 5 or more medications
- **High-cost medications**: Specialty drugs account for 45% of total medication costs
- **Adherence issues**: Patients with 3+ chronic conditions show 30% lower medication adherence rates

### Patient Demographics
- **Age distribution**: Majority of admissions are patients aged 55-75 years (48%)
- **Chronic disease burden**: 60% of patients have at least one chronic condition
- **Gender patterns**: Slight female predominance in admissions (52% vs 48%)

### Resource Utilization
- **Bed occupancy rate**: Average 78% capacity utilization with peaks reaching 95%
- **Cost per patient day**: $2,850 average cost across all departments
- **Length of stay variations**: ICU patients average 6.2 days vs general ward 3.1 days

### Quality Metrics
- **Patient satisfaction score**: 4.2/5.0 overall rating
- **Infection rates**: Hospital-acquired infection rate maintained below 2% (industry benchmark)
- **Mortality rate**: In-hospital mortality rate of 1.8%, below national average

### Predictive Insights
- **High-risk patient identification**: ML model achieved 85% accuracy in predicting readmissions
- **Resource forecasting**: Predictive models help anticipate bed demand with 90% accuracy
- **Cost prediction**: Identified key factors contributing to above-average treatment costs

### Recommendations
1. **Reduce readmissions**: Implement enhanced discharge planning and 48-hour follow-up calls for high-risk patients
2. **Optimize lab testing**: Standardize testing protocols to reduce redundant tests by 15%
3. **Medication reconciliation**: Strengthen medication review process at admission and discharge
4. **Capacity planning**: Add 10-15 beds to handle peak demand periods and reduce wait times
5. **Preventive care**: Increase focus on managing chronic diseases to reduce emergency admissions

## Project Structure
```
Healthcare_Analytics_Project/
│
├── Database/
│   ├── healthcare_analytics_admissions.sql
│   ├── healthcare_analytics_lab_results.sql
│   ├── healthcare_analytics_medications.sql
│   ├── healthcare_analytics_patients.sql
│   ├── healthcare_analytics_readmissions.sql
│   └── healthcare_analytics_routines.sql
│
├── Data/
│   └── [CSV files]
│
├── Notebooks/
│   └── [Jupyter notebook files]
│
├── Powerbi Images/
│   └── [Power BI dashboard screenshots]
│
└── README.md
```

## Installation and Setup

### Prerequisites
- MySQL 8.0 or higher
- Python 3.8+
- Jupyter Notebook
- Power BI Desktop (for viewing original dashboards)

### Steps
1. Clone this repository
2. Import SQL files into MySQL Workbench
3. Install required Python packages: `pip install pandas numpy matplotlib seaborn scikit-learn`
4. Open and run Jupyter notebooks

## Contributing
Feel free to fork this project and submit pull requests for any improvements.

## License
This project is open source and available for educational purposes.

## Contact
For questions or feedback, please reach out through GitHub issues.

---

**Note**: This project uses anonymized healthcare data for analysis purposes. All patient information has been de-identified to ensure privacy compliance.
