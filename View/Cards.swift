//
//  Cards.swift
//  Cards
//
//  Created by Дмитрий Гусев on 08.12.2022.
//

import Foundation
import UIKit

protocol FlipableView: UIView {
    var isFlipped: Bool {get set}
    var flipCompletionHandler: ((FlipableView) -> Void)? {get set}
    func flip()
}

class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlipableView {
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var flipCompletionHandler: ((FlipableView) -> Void)?
    var storage = UserDefaults.standard
    
    // внутренний отступ представления
    private let margin: Int = 10
    
    // представление с лицевой стороной карты
    lazy var frontSideView: UIView = self.getFrontSideView()
    // представление с обратной стороной карты
    lazy var backSideView: UIView = self.getBackSideView()
    
    // возвращает представление для лицевой стороны карточки
    private func getFrontSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
        
        let shapeView = UIView(frame: CGRect(x: margin, y: margin, width: Int(self.bounds.width) - margin * 2, height: Int(self.bounds.height) - margin * 2))
        view.addSubview(shapeView)
        
        // создание слоя с фигурой
        let shapeLayer = ShapeType(size: shapeView.frame.size, fillColor: color.cgColor)
        shapeView.layer.addSublayer(shapeLayer)
        
        // скругляем углы корневого слоя
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornerRadius)
        
        return view
    }
    
    // возвращает вью для обратной стороны карточки
    private func getBackSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        var backSide = [String]()
        view.backgroundColor = .white
        if (storage.object(forKey: "settingBackSideCircle") as? Bool) ?? true {
            backSide.append("circle")
        }
        if (storage.object(forKey: "settingBackSideLine") as? Bool) ?? true {
            backSide.append("line")
        }
        if backSide.count == 0 {
            backSide.append("empty")
        }
        
        //выбор случайного узора для рубашки
        
        switch backSide.randomElement()! {
        case "circle":
            let layer = BackSideCircle(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        case "line":
            let layer = BackSideLine(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        case "empty":
            let layer = BackSideEmpty(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        default:
            break
        }
        // скругляем углы корневого слоя
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornerRadius)
        
        return view
    }

    
    // цвет фигуры
    var color: UIColor!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
        //перенес в функцию draw
//        if isFlipped {
//            self.addSubview(backSideView)
//            self.addSubview(frontSideView)
//        } else {
//            self.addSubview(frontSideView)
//            self.addSubview(backSideView)
//        }
        setupBorders()
    }
    
    //радиус закругления
    var cornerRadius = 20
    
    // настройка границ
    private func setupBorders() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    override func draw(_ rect: CGRect) {
        // удаляем добавленные ранее представления
        backSideView.removeFromSuperview()
        frontSideView.removeFromSuperview()
        
        // добавляем новые представления
                if isFlipped {
                    self.addSubview(backSideView)
                    self.addSubview(frontSideView)
                } else {
                    self.addSubview(frontSideView)
                    self.addSubview(backSideView)
                }
    }
    // ГЛАВА 19 - События и анимации
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesBegan Card")
//    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesMoved Card")
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesEnded Card")
//
//    }
    
  
    
    // точка привязки(anchorPoint не давало создать!!)
    private var anchopPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // изменяем координаты точки привязки
        anchopPoint.x = touches.first!.location(in: window).x - frame.minX
        anchopPoint.y = touches.first!.location(in: window).y - frame.minY
        
        // сохраняем исходные координаты
        startTouchPoint = frame.origin

    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.frame.origin.x = touches.first!.location(in: window).x - anchopPoint.x
        self.frame.origin.y = touches.first!.location(in: window).y - anchopPoint.y
        
//        if  self.frame.origin.y > BoardGameController().boardGameView.frame.height{
//            UIView.animate(withDuration: 0.5, animations: {
//                self.frame.origin = self.startTouchPoint
//            }) }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.frame.origin == startTouchPoint {
            flip()
        }
        // анимировано возвращаем карточку в исходную позицию
        UIView.animate(withDuration: 0.5, animations: {
            self.frame.origin = self.startTouchPoint
            
            
            // переворачиваем представление
//            if self.transform.isIdentity {
//                self.transform = CGAffineTransform(rotationAngle: .pi)
//            } else {
//                self.transform = .identity
//            }

        })
        
    }
    
    
    private var startTouchPoint: CGPoint!
    
    func flip() {
        // определяем, между какими представлениями осуществить переход
        let fromView = isFlipped ? frontSideView : backSideView
        let toView = isFlipped ? backSideView : frontSideView
        // запускаем анимированный переход
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromTop], completion: { _ in
            // обработчик переворота
            self.flipCompletionHandler?(self)
            
            
        })
        
        storage.set(9, forKey: "score")
        
        self.setNeedsDisplay()
        
                isFlipped = !isFlipped
    }

}

extension UIResponder {
    func responderChain() -> String {
        guard let next = next else {
            return String(describing: Self.self)
        }
        return String(describing: Self.self) + " -> " + next.responderChain()
    }
}
