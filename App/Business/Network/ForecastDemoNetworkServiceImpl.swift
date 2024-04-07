//
//  ForecastDemoNetworkServiceImpl.swift
//  App
//
//  Created by Ino on 06/04/2024.
//

import Foundation
import Combine

class ForecastDemoNetworkServiceImpl: ForecastNetworkService {
    
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        let demo = [
            ForecastItemDTO(day: "1",
                            description: "Sunny",
                            sunrise: 28140,
                            sunset: 62880,
                            chanceRain: 0.35,
                            high: 14,
                            low: 6,
                            type: "sunny"),
            ForecastItemDTO(day: "2",
                            description: "Rain",
                            sunrise: 28260,
                            sunset: 62820,
                            chanceRain: 0.85,
                            high: 15,
                            low: 7,
                            type: "rain"),
            ForecastItemDTO(day: "3",
                            description: "Lightning",
                            sunrise: 28380,
                            sunset: 62700,
                            chanceRain: 0.50,
                            high: 15,
                            low: 6,
                            type: "lightning"),
            ForecastItemDTO(day: "4",
                            description: "Windy",
                            sunrise: 28480,
                            sunset: 62800,
                            chanceRain: 0.15,
                            high: 13,
                            low: 6,
                            type: "windy")
        ]
        
        return Future<[ForecastItemDTO], Error> { promise in
            promise(.success(demo))
        }
        .eraseToAnyPublisher()
    }
    
}
