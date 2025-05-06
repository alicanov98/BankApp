//
//  SwiftUIView.swift
//  BankApp
//
//  Created by Malik Alijanov on 03.05.25.
//

import SwiftUI

import SwiftUI

struct CustomProgressBar: View {
    var currentValue: Double
    var maxValue: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(height: 10)
                    .foregroundColor(Color.gray.opacity(0.2))

                Capsule()
                    .frame(width: CGFloat(currentValue / maxValue) * geometry.size.width, height: 10)
                    .foregroundColor(.red)
            }
        }
        .frame(height: 10)
    }
}


#Preview {
    CustomProgressBar(currentValue: 10,maxValue: 100)
}



