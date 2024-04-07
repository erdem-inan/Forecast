//
//  ForecastServiceImpl.swift
//  App
//
//  Created by Ino on 06/04/2024.
//

import Foundation
import Combine
import Global

class ForecastServiceImpl: ForecastService {
    
    // MARK: - Properties
    
    @Inject private var networkService: ForecastNetworkService
    var items = CurrentValueSubject<ForecastItems, Never>(ForecastItems())
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Management
    
    func fetchForecasts() {
        cancellable = networkService.getForecast()
            .map { dtos in
                dtos.map { ForecastItem(from: $0) }
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("successfully fetch forecast")
                case .failure(let failure):
                    print("fail to fetch forecast, error: \(failure)")
                }
            }, receiveValue: { [weak self] forecastItems in
                self?.items.send(forecastItems)
            })
    }
    
    func delete(item: ForecastItem) {
        guard let itemIndex = items.value.firstIndex(where: { $0.day == item.day }) else {
            return
        }
        
        var forecastItems = items.value
        forecastItems.remove(at: itemIndex)
        items.send(forecastItems)
    }

}
