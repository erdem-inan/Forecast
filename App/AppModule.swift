//
//  AppModule.swift
//  App
//
//

import Global

public class AppModule: Module {
    public static var shared = AppModule()
    private init() {
        // Singleton
    }

    public func registerServices() {
        #if DEMO
        GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastDemoNetworkServiceImpl() }
        #else
        GlobalContainer.defaultContainer.register(ForecastNetworkService.self) { _ in ForecastNetworkServiceImpl() }
        #endif
        
        GlobalContainer.defaultContainer.register(ForecastService.self) { _ in ForecastServiceImpl() }
    }
}
