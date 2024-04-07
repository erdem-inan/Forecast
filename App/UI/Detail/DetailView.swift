//
//  DetailView.swift
//  App
//
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties
    
    var viewModel: DetailViewModel
    
    // MARK: - View
    
    var body: some View {
        VStack {
            forecastHeaderView
            temperatureView
            sunView
            chanceRainView
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.background))
    }
    
    private var forecastHeaderView: some View {
        VStack(spacing: 32) {
            Image(viewModel.weatherImage)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            VStack(spacing: 8) {
                Text("Day")
                    .foregroundStyle(.white)
                    .font(.caption)
                Text(viewModel.day)
                    .foregroundStyle(.white)
                    .font(.title)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var chanceRainView: some View {
        HStack {
            VStack(spacing: 16) {
                Text("Change rain")
                    .foregroundStyle(.white)
                    .font(.caption)
                ZStack {
                    CircularView(progress: viewModel.chanceRain)
                        .frame(width: 100, height: 100)
                    
                    Text(viewModel.chanceRainPercentage)
                        .foregroundStyle(.white)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
                .frame(maxWidth: .infinity)
        }
    }
    
    private var temperatureView: some View {
        HStack {
            DetailCell(title: "Min Temp",
                       description: viewModel.minTemp,
                           imageName: "thermometer.low")
            
            DetailCell(title: "Max Temp",
                       description: viewModel.maxTemp, 
                       imageName: "thermometer.high")
        }
    }
    
    private var sunView: some View {
        HStack {
            DetailCell(title: "Sunrise",
                       description: viewModel.sunrise,
                       imageName: "sunrise")
            
            DetailCell(title: "Sunset",
                       description: viewModel.sunset,
                       imageName: "sunset")
        }
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let forecast = ForecastItem(day: "1",
                                    description: "Sunny",
                                    sunrise: Date(),
                                    sunset: Date(),
                                    chanceRain: 0.75,
                                    high: 20,
                                    low: 12,
                                    type: .rain)
        
        return DetailView(viewModel: DetailViewModel(forecast: forecast))
            .previewLayout(.sizeThatFits)
    }
}
