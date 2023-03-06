//
//  Card.swift
//  Cards
//
//  Created by Дмитрий Гусев on 08.12.2022.
//

import Foundation
import UIKit

// типы фигуры карт
enum CardType: String, CaseIterable {
    case circle = "circle"
    case cross = "fill"
    case square = "square"
    case fill = "cross"
    case circleNoColor = "circleNoColor"
}

// цвета карт
enum CardColor: String, CaseIterable {
    case red = "red"
    case green = "green"
    case black = "black"
    case gray = "gray"
    case brown = "brown"
    case yellow = "yellow"
    case purple = "purple"
    case orange = "orange"
}
// общее количество содержимого енумов
var allEnum = CardType.allCases.count + CardColor.allCases.count

// игральная карточка
typealias Card = (type: CardType, color: CardColor)
