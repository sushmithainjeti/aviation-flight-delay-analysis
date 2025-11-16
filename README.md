✈️ Aviation Flight Delay Analysis
📊 Project Overview
Comprehensive data analysis of 1,048,575 flight records to identify delay patterns, operational inefficiencies, and aircraft performance metrics across major U.S. airlines and airports.
Tools Used: SQL (SQLite), Microsoft Excel, Data Visualization

🎯 Objectives

Analyze flight delay patterns across major airlines and airports
Identify root causes of delays (Air Traffic Control, Maintenance, Weather)
Compare aircraft performance (Airbus A320 vs. Boeing 737/777)
Derive actionable insights for operational efficiency improvements


📁 Project Structure
aviation-flight-delay-analysis/
│
├── README.md                          # Project documentation
├── data/                              # Dataset information
│   └── dataset_info.txt              # Link to Kaggle dataset
├── sql_queries.sql                    # All 11 SQL queries
├── Flight_Delay_Analysis.xlsx        # Excel analysis with pivot tables
└── Aviation_Analysis_Report.pdf      # Detailed project report

📈 Key Findings
1. Delay Distribution by Airline

Southwest Airlines: 2,632,056 total delay minutes (262,876 flights)
United Airlines: 2,621,135 delay minutes (261,803 flights)
American Airlines: 2,618,201 delay minutes (262,251 flights)
Delta Airlines: 2,611,757 delay minutes (261,645 flights)

Insight: All major carriers show similar delay patterns, suggesting industry-wide operational challenges.
2. Top Airports with Most Delays

ORD (Chicago O'Hare): 256,112 delayed flights
ATL (Atlanta): 256,064 delayed flights
JFK (New York): 255,750 delayed flights
LAX (Los Angeles): 255,716 delayed flights
DFW (Dallas): 255,112 delayed flights

3. Root Causes of Delays
Delay ReasonFlight CountAir Traffic Control426,438Maintenance426,168Weather426,098
Insight: The three major causes are nearly equal, requiring multi-faceted solutions.
4. Aircraft Performance Analysis
Aircraft TypeTotal Delay MinutesPerformanceAirbus A3206,608,110CompetitiveBoeing 7376,607,781SimilarBoeing 7776,602,803Similar
Key Finding: Airbus A320 demonstrates operational parity with Boeing aircraft, indicating delays are operationally driven rather than aircraft-specific.

🛠️ Technical Implementation
Excel Analysis

Created 5 pivot tables analyzing:

Delays by Airline
Delays by Origin Airport
Delays by Reason
Delays by Aircraft Type
Cancellations by Airline


Generated 5 visualizations (column charts, bar charts)

SQL Analysis
Wrote 11 advanced SQL queries including:

Aggregate functions (COUNT, SUM, AVG)
GROUP BY and ORDER BY operations
WHERE clauses with filtering
CASE statements for categorization
Common Table Expressions (CTEs)
Window functions (RANK)
LIMIT and HAVING clauses


💡 Business Recommendations
For Airlines:

Improve ATC Coordination: Invest in better scheduling systems
Predictive Maintenance: Implement data-driven maintenance scheduling
Airport-Specific Strategies: Develop targeted initiatives for high-congestion hubs

For Airports:

Capacity Expansion: Invest in additional gates, runways, and taxiways
Technology Integration: Implement advanced ground traffic management
Weather Preparedness: Enhance all-weather operation infrastructure

For Aircraft Manufacturers (Airbus):

Market Positioning: Leverage operational parity data for competitive advantage
Customer Communication: Share efficiency data with potential airline customers
Data Analytics Services: Offer operational optimization consulting


📊 Sample Visualizations
Note: Add screenshots of your Excel charts here when uploading to GitHub

🔍 Sample SQL Queries
Query 1: Top 5 Airports with Most Delays
sqlSELECT Origin, COUNT(*) AS DelayedFlights
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY Origin
ORDER BY DelayedFlights DESC
LIMIT 5;
Query 2: Average Delay by Airline
sqlSELECT Airline, AVG(DelayMinutes) AS AvgDelay
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY Airline
ORDER BY AvgDelay DESC;
See sql_queries.sql for all 11 queries

📚 Dataset Information
Source: Kaggle - Flight Delays Dataset
Size: 1,048,575 records
Columns:

FlightID, Airline, FlightNumber, Origin, Destination
ScheduledDeparture, ActualDeparture, ScheduledArrival, ActualArrival
DelayMinutes, DelayReason, Cancelled, Diverted
AircraftType, TailNumber, Distance


🚀 How to Run This Analysis
Prerequisites

Microsoft Excel 2010 or later
SQLite or DB Browser for SQLite
Basic understanding of SQL and Excel

Steps

Download the dataset from Kaggle
Import CSV into SQLite database
Run SQL queries from sql_queries.sql
Open Flight_Delay_Analysis.xlsx for visualizations
Review findings in Aviation_Analysis_Report.pdf


🎓 Skills Demonstrated

Data Analysis: Large-scale dataset analysis (1M+ records)
SQL: Complex queries with joins, aggregations, window functions
Excel: Pivot tables, VLOOKUP, data visualization
Statistical Analysis: Pattern recognition, trend identification
Business Intelligence: Actionable insights and recommendations
Technical Documentation: Clear project documentation


📫 Contact
Sushmitha Injeti
📧 Email: sushmithainjeti529@gmail.com
💼 LinkedIn: linkedin.com/in/sushmitha-injeti-123476284
📍 Location: Visakhapatnam, Andhra Pradesh, India

📄 License
This project is available for educational and portfolio purposes.

🙏 Acknowledgments

Dataset: Kaggle Flight Delays Dataset
Tools: Microsoft Excel, SQLite, DB Browser for SQLite
Project completed as part of data analysis skill development


⭐ If you find this project helpful, please consider giving it a star!
