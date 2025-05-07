//
//  LabeledInputField.swift
//  BankApp
//
//  Created by Malik Alijanov on 08.05.25.
//

import SwiftUI

struct LabeledInputField: View {
    var label: String
    var iconName: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 15))
                .foregroundColor(.gray)
            
            HStack(spacing: 10) {
                Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                TextField("Daxil edin...", text: $text)
                    .foregroundColor(.black)
            }
            .padding(.vertical,12)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.2)),
                alignment: .bottom
            )
            .cornerRadius(10)
        }
        .padding(.bottom,16)
    }
}


#Preview {
    StatefulPreviewWrapper("Tanya Myroniuk") { binding in
        LabeledInputField(label: "Full Name", iconName: "profileIcon", text: binding)
    }
}


struct StatefulPreviewWrapper<Value>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> AnyView

    init(_ value: Value, content: @escaping (Binding<Value>) -> some View) {
        self._value = State(initialValue: value)
        self.content = { binding in AnyView(content(binding)) }
    }

    var body: some View {
        content($value)
    }
}
