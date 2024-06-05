//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Shilpa Joy on 2024-06-04.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundcolor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundcolor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
