//
//  ForecastItem.swift
//  App
//
//

import Foundation

struct ForecastItem {
    
    // MARK: - Properties
    
    let day: String
    let description: String
    let sunrise: Date
    let sunset: Date
    let chanceRain: Double
    let high: Int
    let low: Int
    let type: ForecastItemType
    
    // MARK: - Enum
    
    enum ForecastItemType: String {
        case sunny
        case lightning
        case rain
        case overcast
        case windy
        case showers
    }
    
    // MARK: - Init
    
    init(from dto: ForecastItemDTO) {
        day = dto.day
        description = dto.description
        sunrise = Date(timeIntervalSince1970: TimeInterval(dto.sunrise))
        sunset = Date(timeIntervalSince1970: TimeInterval(dto.sunset))
        chanceRain = dto.chanceRain
        high = dto.high
        low = dto.low
        type = ForecastItemType(rawValue: dto.type)!
    }
    
    init(day: String, description: String, sunrise: Date, sunset: Date, chanceRain: Double, high: Int, low: Int, type: ForecastItemType) {
        self.day = day
        self.description = description
        self.sunrise = sunrise
        self.sunset = sunset
        self.chanceRain = chanceRain
        self.high = high
        self.low = low
        self.type = type
    }
    
}

typealias ForecastItems = [ForecastItem]
