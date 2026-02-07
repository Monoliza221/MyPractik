//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Шамиль Хоролов on 05.02.2026.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        let background = UIView()
        background.backgroundColor = .black
        self.view = background
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
        
        view.addSubview(expressionLabel)
        view.addSubview(resultLabel)
        
        let buttons = [
            buttonAC,
            buttonOne, buttonTwo, buttonThree,
            buttonFour, buttonFive, buttonSix,
            buttonSeven, buttonEight, buttonNine,
            buttonZero,
            buttonPlus, buttonMinus, buttonMulti, buttonDivision,
            buttonComma, buttonEqual
        ]
        buttonAC.updateBackgroundColor(.systemRed)
        buttons.forEach { view.addSubview($0) }
        [buttonPlus, buttonMinus, buttonMulti, buttonDivision].forEach { $0.updateBackgroundColor(.systemOrange)}
        
        let numbersButton = [
            buttonZero,
            buttonOne, buttonTwo, buttonThree,
            buttonFour, buttonFive, buttonSix,
            buttonSeven, buttonEight, buttonNine
        ]
        numbersButton.forEach { $0.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)}
        
        buttonPlus.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        buttonMinus.addTarget(self, action: #selector(minusPresses), for: .touchUpInside)
        buttonMulti.addTarget(self, action: #selector(multiPressed), for: .touchUpInside)
        buttonDivision.addTarget(self, action: #selector(dividepressed), for: .touchUpInside)
        buttonEqual.addTarget(self, action: #selector(equalPressed), for: .touchUpInside)
        buttonComma.addTarget(self, action: #selector(decimalPressed), for: .touchUpInside)
        buttonAC.addTarget(self, action: #selector(acPressed), for: .touchUpInside)
    }
    
    //MARK: Frame
    override func viewDidLayoutSubviews() {
        print(view.frame.width)
        
        super.viewDidLayoutSubviews()
        
        let buttonSize: CGFloat = 90
        let spacing: CGFloat = 10
        let startX: CGFloat = 5
        let startY = view.bounds.midY

        let positions = [
            (buttonOne, 0, 0), (buttonTwo, 1, 0), (buttonThree, 2, 0),
            (buttonFour, 0, 1), (buttonFive, 1, 1), (buttonSix, 2, 1),
            (buttonSeven, 0, 2), (buttonEight, 1, 2), (buttonNine, 2, 2),
            (buttonZero, 1, 3)
        ]
        
        for (button, col, row) in positions {
            button.frame = CGRect(
                x: startX + CGFloat(col) * (buttonSize + spacing),
                y: startY + CGFloat(row) * (buttonSize + spacing),
                width: buttonSize,
                height: buttonSize
            )
        }
        
        let ops = [
            (buttonPlus, 3, 0),
            (buttonMinus, 3, 1),
            (buttonDivision, 3, 2),
            (buttonMulti, 3, 3),
            (buttonEqual, 2, 3),
            (buttonComma, 0, 3)
        ]
        
        for (button, col, row) in ops {
            button.frame = CGRect(
                x: startX + CGFloat(col) * (buttonSize + spacing),
                y: startY + CGFloat(row) * (buttonSize + spacing),
                width: buttonSize,
                height: buttonSize
            )
        }
        
        buttonAC.frame = CGRect(x: startX,
                                y: startY - (buttonSize + spacing),
                                width: buttonSize,
                                height: buttonSize)

        expressionLabel.frame = CGRect(
            x: 10,
            y: view.bounds.midY - 280,
            width: view.bounds.width - 20,
            height: 90
        )
        
        resultLabel.frame = CGRect(
            x: 10,
            y: expressionLabel.frame.maxY - 10,
            width: view.bounds.width - 20,
            height: 90
        )
    }
    
    //MARK: Label
    private let expressionLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .right
        label.textColor = .lightGray
        label.numberOfLines = 1
        return label
    }()
    
    private let resultLabel: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 70)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        return label
    }()
    
    //MARK: Buttons
    let buttonOne = ButtonNumbers(text: "1")
    let buttonTwo = ButtonNumbers(text: "2")
    let buttonThree = ButtonNumbers(text: "3")
    let buttonFour = ButtonNumbers(text: "4")
    let buttonFive = ButtonNumbers(text: "5")
    let buttonSix = ButtonNumbers(text: "6")
    let buttonSeven = ButtonNumbers(text: "7")
    let buttonEight = ButtonNumbers(text: "8")
    let buttonNine = ButtonNumbers(text: "9")
    let buttonZero = ButtonNumbers(text: "0")
    let buttonPlus = ButtonNumbers(text: "+")
    let buttonMinus = ButtonNumbers(text: "-")
    let buttonMulti = ButtonNumbers(text: "×")
    let buttonComma = ButtonNumbers(text: ",")
    let buttonDivision = ButtonNumbers(text: "÷")
    let buttonEqual = ButtonNumbers(text: "=")
    
    let buttonAC = ButtonNumbers(text: "AC")
    

    //MARK: Logic
    private var numbers: [Double] = []
    private var operations: [Operation] = []
    private var isTypingNumber = false
    
    enum Operation {
        case add, subtract, multiply, divide
    }
    
    @objc private func numberPressed(_ sender: UIButton) {
        animateButton(sender)
        
        guard let digit = sender.titleLabel?.text else { return }
        
        if resultLabel.text == "0" || !isTypingNumber {
            resultLabel.text = digit
            isTypingNumber = true
        } else {
            resultLabel.text! += digit
        }
    }

    @objc private func decimalPressed() {
        animateButton(buttonComma)
        if !(resultLabel.text?.contains(".") ?? false) {
            resultLabel.text! += "."
            isTypingNumber = true
        }
    }
    
    @objc private func plusPressed() {
        animateButton(buttonPlus)
        setOperation(.add)
    }
    @objc private func minusPresses() {
        animateButton(buttonMinus)
        setOperation(.subtract)
    }
    @objc private func multiPressed() {
        animateButton(buttonMulti)
        setOperation(.multiply)
    }
    @objc private func dividepressed() {
        animateButton(buttonDivision)
        setOperation(.divide)
    }
    
    private func setOperation(_ operation: Operation) {
        if let text = resultLabel.text?.replacingOccurrences(of: ",", with: "."),
            let number = Double(text) {
            numbers.append(number)
            operations.append(operation)
            isTypingNumber = false
            
            let symbol: String
            switch operation {
            case .add: symbol = "+"
            case .subtract: symbol = "-"
            case .multiply: symbol = "×"
            case .divide: symbol = "÷"
            }
            expressionLabel.text! += "\(formatResult(number)) \(symbol)"
            resultLabel.text = "0"
        }
    }
    
    @objc private func equalPressed() {
        animateButton(buttonEqual)
//
        if let text = resultLabel.text?.replacingOccurrences(of: ",", with: "."),
        let lastNumber = Double(text) {
            numbers.append(lastNumber)
        }
            
        var result = numbers.first ?? 0
        
        for i in 0..<operations.count {
            let op = operations[i]
            let num = numbers[i + 1]
            
            switch op {
            case .add: result += num
            case .subtract: result -= num
            case .multiply: result *= num
            case .divide: result /= num
            }
        }
        
        expressionLabel.text! = numbers.map { formatResult($0) }
            .enumerated()
            .map { index, num in
                index < operations.count ? "\(num) \(symbol(for: operations[index]))" : "\(num)"
            }
            .joined(separator: " ")
        resultLabel.text = formatResult(result)
        
        numbers.removeAll()
        operations.removeAll()
        isTypingNumber = false
    }
    
    private func symbol(for op: Operation) -> String {
        switch op {
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        }
    }
    
    @objc private func acPressed() {
        animateButton(buttonAC)
        
        resultLabel.text = "0"
        numbers.removeAll()
        operations.removeAll()
        isTypingNumber = false
        
        expressionLabel.text = ""
    }

    
    @objc private func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.state == .ended {
            resultLabel.text = "0"
            numbers.removeAll()
            operations.removeAll()
            isTypingNumber = false
            expressionLabel.text = ""
        }
    }
    
    private func formatResult(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(value)
        }
    }
    
    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            button.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }
}


#Preview {
    ViewController()
}



