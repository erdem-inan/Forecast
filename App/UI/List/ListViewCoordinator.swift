//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()

        viewModel.showDetail = { item in
            self.goToForecastDetail(for: item)
        }

        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    private func goToForecastDetail(for item: ForecastItem) {
        let coordinator = DetailViewCoordinator(navigationController: navigationController)
        coordinator.start(forecastItem: item)
        navigationController?.pushViewController(coordinator.viewController!, animated: true)
    }
}
