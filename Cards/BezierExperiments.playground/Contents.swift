//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        //создаем кривые на сцене
        createBezier(on: view)
    }
    
    private func createBezier(on view: UIView) {
        // 1
        // создаем графический контекст (слой)
        // на нем в дальнейшем будут рисоваться кривые
        let shapeLayer = CAShapeLayer()
        // добавляем слой в качестве дочернего к корневому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        // 2
        // изменение цвета линий
        shapeLayer.strokeColor = UIColor.gray.cgColor
        // изменение толщины линий
        shapeLayer.lineWidth = 5
        
        // 3
        // создание фигуры
        shapeLayer.path = getCoock().cgPath
        
        // определение фонового цвета
        shapeLayer.fillColor = UIColor.green.cgColor
        
        
        
    }
    private func getPath() -> UIBezierPath {
        // 1
        let path = UIBezierPath()
        // 2
        path.move(to: CGPoint(x: 50, y: 50))
        // 3
        path.addLine(to: CGPoint(x: 150, y: 50))
        
        // 4 создание второй линии
        path.addLine(to: CGPoint(x: 150, y: 150))
        
        // 5 завершение фигуры
        path.close()
        
        
        // Создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.close()
        
        // создание сущности прямоугольник
        let rect = CGRect(x: 10, y: 10, width: 200, height: 100)
        // создание прямоугольника
        let path2 = UIBezierPath(rect: rect)
        
        
        return path
    }
    
    
    // создание сущности прямоугольник
    private func getPathRect() -> UIBezierPath {
        // создание сущности прямоугольник
        let rect = CGRect(x: 10, y: 10, width: 200, height: 100)
        // создание прямоугольника
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 30)
        
        return path
    }
    
    // создание дуги
    private func getPathDuga() -> UIBezierPath {
        
        let centerPoint = CGPoint(x: 200, y: 200)
        let path = UIBezierPath(arcCenter: centerPoint, radius: 150, startAngle: .pi/5, endAngle: .pi, clockwise: true)
        return path
    }
    
    // создание овала
    
    private func getPathOval() -> UIBezierPath {
        let rect = CGRect(x: 50, y: 50, width: 200, height: 100)
        let path = UIBezierPath(ovalIn: rect)
        
        return path
    }
    // создание кривых
    private func getPathCurve() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 200, y: 20), controlPoint2: CGPoint(x: 20, y: 200))
        return path
    }
    
    // поварская шляпа
    private func getCoock() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 50, startAngle: .pi, endAngle: 0, clockwise: true)
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addArc(withCenter: CGPoint(x: 220, y: 150), radius: 50, startAngle: .pi*3/2, endAngle: .pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 260))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 80, y: 200))
        path.addArc(withCenter: CGPoint(x: 80, y: 150), radius: 50, startAngle: .pi/2, endAngle: .pi*3/2, clockwise: true)
        path.close()
        
        return path
    }
    
    
    
}

PlaygroundPage.current.liveView = MyViewController()

