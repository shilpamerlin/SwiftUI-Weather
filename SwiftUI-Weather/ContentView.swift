//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Shilpa Joy on 2024-06-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                CityView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temparature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temparature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temparature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temparature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temparature: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temparature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundcolor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temparature: Int
    
    var body: some View {
        VStack() {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temparature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temparature: Int
    var body: some View {
        
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temparature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
