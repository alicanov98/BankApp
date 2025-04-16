//
//  StackedCardsView.swift
//  BankApp
//
//  Created by Malik Alijanov on 16.04.25.
//

import SwiftUI

struct StackedCardsView: View {
    @ObservedObject var viewModel: BankViewModel
    @State private var topCardOffset: CGSize = .zero

    var body: some View {
        ZStack {
            ForEach(Array(viewModel.cards.enumerated()), id: \.element.id) { index, card in
                CardView(card: card)
                    .offset(y: CGFloat(index) * 10)
                    .scaleEffect(index == viewModel.cards.count - 1 ? 1.0 : 0.95)
                    .offset(x: index == viewModel.cards.count - 1 ? topCardOffset.width : 0)
                    .gesture(
                        index == viewModel.cards.count - 1 ?
                        DragGesture()
                            .onChanged { value in
                                topCardOffset = value.translation
                            }
                            .onEnded { value in
                                if abs(value.translation.width) > 100 {
                                    withAnimation {
                                        viewModel.cycleCard()
                                        topCardOffset = .zero
                                    }
                                } else {
                                    withAnimation {
                                        topCardOffset = .zero
                                    }
                                }
                            }
                        : nil
                    )
            }
        }
    }
}



