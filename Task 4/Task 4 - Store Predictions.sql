CREATE TABLE Sales_Forecasts (
    Forecast_ID INT IDENTITY(1,1) PRIMARY KEY,
    Forecast_Date DATE,
    SKU VARCHAR(50),
    Predicted_Sales FLOAT,
    StockOutRisk BIT,
    Reorder_Quantity INT
);


SELECT TOP 10 * FROM dbo.Sales_Forecasts;