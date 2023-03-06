//
//  Game.swift
//  Cards
//
//  Created by Дмитрий Гусев on 08.12.2022.
//

import Foundation
import UIKit

class Game {
    
    var storage = UserDefaults.standard
    // количество пар уникальных карточек
    var cardsCount = 0
    // массив сгенерированных карточек
    var cards = [Card]()
    
    // генерация массива случайных карт
    func generateCards() {
        // генерируем новый массив карточек
        var cards2 = [Card]()
        var color = [CardColor]()
        var type = [CardType]()
        for i in CardColor.allCases {
            if (storage.object(forKey: i.rawValue) as? Bool) ?? true {
                color.append(i)
            }
        }
        for i in CardType.allCases {
            if (storage.object(forKey: i.rawValue) as? Bool) ?? true {
                type.append(i)
            }
        }
        
//        for i in CardType.allCases {
//            if storage.object(forKey: i.rawValue) as? Bool ?? true {
//                type.append(i)
//            }
//        }
        
        for _ in 0...cardsCount {
            
            let randomElement = (type: type.randomElement()!, color: color.randomElement()!)
//            let randomElement = (type: type.randomElement()!, color: color.randomElement()!)

            
            cards2.append(randomElement)
            
            
            if cards2.count == cardsCount + 2 {
                break
            }
        }
        self.cards = cards2
        
    }
    // проверка эквивалентности карточек
    func checkCards(_ firstCard: Card, _ secondCard: Card) -> Bool {
        if firstCard == secondCard {
            return true
        }
        return false
    }

}
