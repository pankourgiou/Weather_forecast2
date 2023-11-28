import Foundation

// Data representing historical temperature (x: day, y: temperature)
let historicalData: [(Double, Double)] = [(1, 20), (2, 22), (3, 25), (4, 18), (5, 30)]

// Function to perform linear regression
func linearRegression(data: [(Double, Double)]) -> (Double, Double) {
    let n = Double(data.count)
    
    // Calculate the sum of x, y, x^2, and xy
    let sumX = data.reduce(0) { $0 + $1.0 }
    let sumY = data.reduce(0) { $0 + $1.1 }
    let sumXSquare = data.reduce(0) { $0 + pow($1.0, 2) }
    let sumXY = data.reduce(0) { $0 + $1.0 * $1.1 }
    
    // Calculate the slope (m) and y-intercept (b) of the linear regression line
    let m = (n * sumXY - sumX * sumY) / (n * sumXSquare - pow(sumX, 2))
    let b = (sumY - m * sumX) / n
    
    return (m, b)
}

// Function to predict temperature for a given day using linear regression
func predictTemperature(day: Double, regressionParameters: (Double, Double)) -> Double {
    let (m, b) = regressionParameters
    return m * day + b
}

// Perform linear regression on historical data
let regressionParameters = linearRegression(data: historicalData)

// Predict temperature for a future day (e.g., day 6)
let futureDay = 6.0
let predictedTemperature = predictTemperature(day: futureDay, regressionParameters: regressionParameters)

print("Predicted temperature for day \(futureDay): \(predictedTemperature) degrees")
