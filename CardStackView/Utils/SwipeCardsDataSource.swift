//
//  SwipeCardsDataSource.swift
//  CardStackView
//
//  Created by Doston Rustamov on 14/03/22.
import UIKit

protocol SwipeCardsDataSource {
    func numberOfCardsToShow() -> Int
    func card(at index: Int) -> SwipeCardView
    func emptyView() -> UIView?
}

protocol SwipeCardsDelegate {
    func swipeDidEnd(on view: SwipeCardView)
}
