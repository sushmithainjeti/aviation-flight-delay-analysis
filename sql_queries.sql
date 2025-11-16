-- ============================================
-- AVIATION FLIGHT DELAY ANALYSIS
-- SQL Queries for Data Analysis
-- Total Records: 1,048,575 flights
-- Author: Sushmitha Injeti
-- Date: November 2025
-- ============================================

-- Query 1: Total Flights by Airline
-- Purpose: Identify flight volume distribution across carriers
-- ============================================
SELECT 
    Airline, 
    COUNT(*) AS TotalFlights
FROM flight_delays
GROUP BY Airline
ORDER BY TotalFlights DESC;


-- Query 2: Top 5 Airports with Most Delayed Flights
-- Purpose: Identify airports with highest delay frequency
-- ============================================
SELECT 
    Origin, 
    COUNT(*) AS DelayedFlights
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY Origin
ORDER BY DelayedFlights DESC
LIMIT 5;


-- Query 3: Average Delay Minutes by Airline
-- Purpose: Compare average delay duration across airlines
-- ============================================
SELECT 
    Airline, 
    AVG(DelayMinutes) AS AvgDelay
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY Airline
ORDER BY AvgDelay DESC;


-- Query 4: Delay Reasons Distribution
-- Purpose: Understand root causes of delays
-- ============================================
SELECT 
    DelayReason, 
    COUNT(*) AS FlightCount
FROM flight_delays
WHERE DelayReason IS NOT NULL AND DelayReason != ''
GROUP BY DelayReason
ORDER BY FlightCount DESC;


-- Query 5: Total Delay Minutes by Aircraft Type
-- Purpose: Compare aircraft operational efficiency
-- ============================================
SELECT 
    AircraftType, 
    SUM(DelayMinutes) AS TotalDelayMinutes
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY AircraftType
ORDER BY TotalDelayMinutes DESC;


-- Query 6: Cancellation Analysis by Airline
-- Purpose: Analyze cancellation patterns by airline
-- Technique: CASE statement for conditional aggregation
-- ============================================
SELECT 
    Airline, 
    COUNT(*) AS TotalFlights,
    SUM(CASE WHEN Cancelled = 'TRUE' THEN 1 ELSE 0 END) AS CancelledFlights
FROM flight_delays
GROUP BY Airline
ORDER BY CancelledFlights DESC;


-- Query 7: Flight Distribution by Distance Range
-- Purpose: Analyze if flight distance impacts delays
-- Technique: CASE statement for data categorization
-- ============================================
SELECT 
    CASE 
        WHEN Distance < 500 THEN 'Short (< 500 miles)'
        WHEN Distance BETWEEN 500 AND 1500 THEN 'Medium (500-1500 miles)'
        ELSE 'Long (> 1500 miles)'
    END AS DistanceCategory,
    COUNT(*) AS FlightCount,
    AVG(DelayMinutes) AS AvgDelay
FROM flight_delays
GROUP BY DistanceCategory
ORDER BY FlightCount DESC;


-- Query 8: Top 10 Most Delayed Routes
-- Purpose: Identify specific routes with highest cumulative delays
-- Technique: Multi-column grouping
-- ============================================
SELECT 
    Origin, 
    Destination, 
    COUNT(*) AS FlightCount,
    AVG(DelayMinutes) AS AvgDelay,
    SUM(DelayMinutes) AS TotalDelay
FROM flight_delays
WHERE DelayMinutes > 0
GROUP BY Origin, Destination
ORDER BY TotalDelay DESC
LIMIT 10;


-- Query 9: Airports with Highest Delay Rate
-- Purpose: Calculate delay rate percentage (delayed flights / total flights)
-- Technique: CAST for type conversion, percentage calculation
-- ============================================
SELECT
    Origin,
    COUNT(CASE WHEN DelayMinutes > 0 THEN 1 END) AS DelayedFlights,
    COUNT(*) AS TotalFlights,
    (CAST(COUNT(CASE WHEN DelayMinutes > 0 THEN 1 END) AS REAL) * 100.0 / COUNT(*)) AS DelayRate
FROM flight_delays
GROUP BY Origin
ORDER BY DelayRate DESC
LIMIT 5;


-- Query 10: Top Airlines for Maintenance Delays
-- Purpose: Rank airlines by maintenance-related delays
-- Technique: Common Table Expression (CTE) + Window function (RANK)
-- ============================================
WITH MaintenanceDelays AS (
    SELECT
        Airline,
        SUM(DelayMinutes) AS TotalMaintenanceDelay
    FROM flight_delays
    WHERE DelayReason = 'Maintenance' AND DelayMinutes > 0
    GROUP BY Airline
)
SELECT
    Airline,
    TotalMaintenanceDelay,
    RANK() OVER (ORDER BY TotalMaintenanceDelay DESC) AS Rank_MaintenanceDelay
FROM MaintenanceDelays
LIMIT 3;


-- Query 11: Low-Volume Airlines (Data Quality Check)
-- Purpose: Identify airlines with insufficient sample size
-- Technique: HAVING clause for aggregate filtering
-- ============================================
SELECT
    Airline,
    COUNT(*) AS TotalFlights
FROM flight_delays
GROUP BY Airline
HAVING COUNT(*) < 10000
ORDER BY TotalFlights DESC;


-- ============================================
-- END OF SQL QUERIES
-- ============================================

-- SUMMARY OF TECHNIQUES USED:
-- - SELECT, FROM, WHERE, GROUP BY, ORDER BY
-- - Aggregate functions: COUNT, SUM, AVG
-- - CASE statements for conditional logic
-- - CAST for type conversion
-- - Common Table Expressions (CTEs)
-- - Window functions (RANK)
-- - HAVING clause for filtered aggregation
-- - LIMIT for result limiting
-- ============================================
