//
//  DetailViewModel.swift
//  App
//
//

import Foundation

class DetailViewModel {
    
    // MARK: - Properties
    
    private var forecast: ForecastItem
    private lazy var dateformatter: DateFormatter = {
        let dateFormattter = DateFormatter()
        dateFormattter.timeStyle = .short
        return dateFormattter
    }()
    
    var day: String {
        return forecast.day
    }
    
    var description: String {
        return forecast.description
    }
    
    var weatherImage: ImageResource {
        switch forecast.type {
        case .sunny:
            return .sunny
        case .lightning:
            return .lightning
        case .rain:
            return .rain
        case .overcast:
            return .overcast
        case .windy:
            return .windy
        case .showers:
            return .showers
        }
    }
    
    var chanceRain: Double {
        return forecast.chanceRain
    }
    
    var chanceRainPercentage: String {
        return "\(Int(chanceRain * 100))%"
    }
    
    var minTemp: String {
        return "\(forecast.low)"
    }
    
    var maxTemp: String {
        return "\(forecast.high)"
    }
    
    var sunrise: String {
        return dateformatter.string(from: forecast.sunrise)
    }
    
    var sunset: String {
        return dateformatter.string(from: forecast.sunset)
    }

    // MARK: - Init
    
    init(forecast: ForecastItem) {
        self.forecast = forecast
    }
    
}
