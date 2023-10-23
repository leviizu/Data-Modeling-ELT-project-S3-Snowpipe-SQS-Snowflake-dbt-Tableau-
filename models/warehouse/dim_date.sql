WITH date_series AS (
  SELECT '1960-01-01'::DATE AS start_date
  UNION ALL
  SELECT DATEADD(DAY, 1, start_date) FROM date_series WHERE start_date <= '2003-12-31'::DATE
)


SELECT
    date_series AS full_date,
    EXTRACT(DOW FROM date_series) AS day_of_week,
    TO_CHAR(date_series, 'Day') AS day_name,
    EXTRACT(MONTH FROM date_series) AS month,
    TO_CHAR(date_series, 'Month') AS month_name,
    EXTRACT(QUARTER FROM date_series) AS quarter,
    EXTRACT(YEAR FROM date_series) AS year
FROM date_series;
