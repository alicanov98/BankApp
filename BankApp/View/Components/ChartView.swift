//
//  AAChartViewContainer.swift
//  BankApp
//
//  Created by Malik Alijanov on 06.05.25.
//


import SwiftUI
import Charts

struct ChartView: View {
    @State private var sampleAnimatics: [SiteView] = sample_analystic
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 4) {
                Text("Current Balance")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .medium))
                
                Text("$\(sampleAnimatics[selectedIndex].views, specifier: "%.2f")")
                    .font(.system(size: 28, weight: .bold))
            }

            ScrollView(.horizontal, showsIndicators: false) {
                Chart {
                    ForEach(sampleAnimatics.indices, id: \.self) { index in
                        LineMark(
                            x: .value("Month", sampleAnimatics[index].month),
                            y: .value("Views", sampleAnimatics[index].views)
                        )
                        .interpolationMethod(.catmullRom)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .foregroundStyle(.blue)
                        
                        if index == selectedIndex {
                            PointMark(
                                x: .value("Month", sampleAnimatics[index].month),
                                y: .value("Views", sampleAnimatics[index].views)
                            )
                            .symbol {
                                Circle()
                                    .strokeBorder(.blue, lineWidth: 4)
                                    .background(Circle().fill(.white))
                                    .frame(width: 16, height: 16)
                            }
                        }
                    }
                }
                .chartYAxis(.hidden)
                .chartXAxis {
                    AxisMarks(values: .stride(by: .month)) { value in
                        AxisGridLine()
                    }
                }
                .frame(width: CGFloat(sampleAnimatics.count) * 60, height: 250)
                HStack(spacing: 16) {
                    ForEach(sampleAnimatics.indices, id: \.self) { index in
                        let item = sampleAnimatics[index]
                        Button(action: {
                            withAnimation(.easeInOut) {
                                selectedIndex = index
                            }
                        }) {
                            Text(item.month.formatted(.dateTime.month(.abbreviated)))
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(selectedIndex == index ? .white : .gray)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(selectedIndex == index ? Color.blue : Color.gray.opacity(0.1))
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal)
            }

            // Aylıq seçim düymələri
            ScrollView(.horizontal, showsIndicators: false) {
         
            }
           
        }
        .padding()
    }
}

#Preview {
    ChartView()
}


