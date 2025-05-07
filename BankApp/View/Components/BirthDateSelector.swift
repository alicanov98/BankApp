//
//  BirthDateSelector.swift
//  BankApp
//
//  Created by Malik Alijanov on 08.05.25.
//

import SwiftUI

struct StatefulDatePreviewWrapper<Value1, Value2, Value3>: View {
    @State private var value1: Value1
    @State private var value2: Value2
    @State private var value3: Value3
    var content: (Binding<Value1>, Binding<Value2>, Binding<Value3>) -> AnyView

    init(_ value1: Value1, _ value2: Value2, _ value3: Value3, content: @escaping (Binding<Value1>, Binding<Value2>, Binding<Value3>) -> some View) {
        self._value1 = State(initialValue: value1)
        self._value2 = State(initialValue: value2)
        self._value3 = State(initialValue: value3)
        self.content = { binding1, binding2, binding3 in AnyView(content(binding1, binding2, binding3)) }
    }

    var body: some View {
        content($value1, $value2, $value3)
    }
}

struct BirthDateSelector: View {
    @Binding var selectedDay: Int
    @Binding var selectedMonth: String
    @Binding var selectedYear: Int

    let days = Array(1...31)
    let months = [
        "Yanvar", "Fevral", "Mart", "Aprel", "May", "İyun",
        "İyul", "Avqust", "Sentyabr", "Oktyabr", "Noyabr", "Dekabr"
    ]
    let years = Array(1950...Calendar.current.component(.year, from: Date())).reversed()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Birth Date")
                .font(.system(size: 15))
                .foregroundColor(.gray)

            HStack(spacing: 20) {
                Picker("Gün", selection: $selectedDay) {
                    ForEach(days, id: \.self) { day in
                        Text("\(day)").tag(day)
                        .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .clipped()

                Picker("Ay", selection: $selectedMonth) {
                    ForEach(months, id: \.self) { month in
                        Text(month).tag(month)
                        .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .clipped()

                Picker("İl", selection: $selectedYear) {
                    ForEach(years, id: \.self) { year in
                        Text("\(year)").tag(year)
                        .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .clipped()
            }
            .frame(maxWidth: .infinity)
        }

    }
}

struct BirthDateSelector_Previews: PreviewProvider {
    static var previews: some View {
        StatefulDatePreviewWrapper(15, "Yanvar", 2000) { day, month, year in
            BirthDateSelector(selectedDay: day, selectedMonth: month, selectedYear: year)
        }
    }
}





