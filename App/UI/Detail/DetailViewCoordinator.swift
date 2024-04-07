//
//  DetailViewCoordinator.swift
//  App
//
//

import Foundation
import UIKit

class DetailViewCoordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var viewController: DetailViewController?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start(forecastItem: ForecastItem) {
        let viewModel = DetailViewModel(forecast: forecastItem)
        let controller = DetailViewController(viewModel: viewModel)
        
        viewController = controller
    }
    
}
