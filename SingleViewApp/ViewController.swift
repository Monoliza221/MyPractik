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
        background.backgroundColor = .systemGray
        self.view = background
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(labelSum)
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonEight)
        view.addSubview(buttonSeven)
        view.addSubview(buttonNine)
        view.addSubview(buttonZero)
        view.addSubview(buttonPlus)
        buttonPlus.updateBackgroundColor(.systemOrange)
        view.addSubview(buttonMinus)
        buttonMinus.updateBackgroundColor(.systemOrange)
        view.addSubview(buttonMulti)
        buttonMulti.updateBackgroundColor(.systemOrange)
        view.addSubview(buttonDivision)
        buttonDivision.updateBackgroundColor(.systemOrange)
        view.addSubview(buttonSmooth)
        view.addSubview(buttonComma)

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handlerSwipe))
        swipe.direction = .right
        labelSum.addGestureRecognizer(swipe)
        
        buttonOne.addTarget(self, action: #selector(one), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(two), for: .touchUpInside)
        buttonThree.addTarget(self, action: #selector(three), for: .touchUpInside)
        buttonFour.addTarget(self, action: #selector(four), for: .touchUpInside)
        buttonFive.addTarget(self, action: #selector(five), for: .touchUpInside)
        buttonSix.addTarget(self, action: #selector(six), for: .touchUpInside)
        buttonSeven.addTarget(self, action: #selector(seven), for: .touchUpInside)
        buttonEight.addTarget(self, action: #selector(ehgiht), for: .touchUpInside)
        buttonNine.addTarget(self, action: #selector(nine), for: .touchUpInside)
        buttonZero.addTarget(self, action: #selector(zero), for: .touchUpInside)
        buttonOne.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        buttonPlus.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        buttonSmooth.addTarget(self, action: #selector(equalPressed), for: .touchUpInside)
        }
    
    //MARK: Frame
    override func viewDidLayoutSubviews() {
        print(view.frame.width)
        
        super.viewDidLayoutSubviews()

        buttonOne.frame = CGRect(x: view.bounds.minX + 5,
                                 y: view.bounds.midY,
                                 width: 90,
                                 height: 90)
        buttonTwo.frame = CGRect(x: view.bounds.minX + 105,
                                 y: view.bounds.midY,
                                 width: 90,
                                 height: 90)
        buttonThree.frame = CGRect(x: view.bounds.minX + 205,
                                   y: view.bounds.midY,
                                   width: 90,
                                   height: 90)
        
        
        buttonFour.frame = CGRect(x: view.bounds.minX + 5,
                                  y: view.bounds.midY + 100,
                                  width: 90,
                                  height: 90)
        buttonFive.frame = CGRect(x: view.bounds.minX + 105,
                                  y: view.bounds.midY + 100,
                                  width: 90,
                                  height: 90)
        buttonSix.frame = CGRect(x: view.bounds.minX + 205,
                                 y: view.bounds.midY + 100,
                                 width: 90,
                                 height: 90)
        
        
        buttonSeven.frame = CGRect(x: view.bounds.minX + 5,
                                   y: view.bounds.midY + 200,
                                   width: 90,
                                   height: 90)
        buttonEight.frame = CGRect(x: view.bounds.minX + 105,
                                   y: view.bounds.midY + 200,
                                   width: 90,
                                   height: 90)
        buttonNine.frame = CGRect(x: view.bounds.minX + 205,
                                  y: view.bounds.midY + 200,
                                  width: 90,
                                  height: 90)
        
        buttonZero.frame = CGRect(x: view.bounds.minX + 105,
                                  y: view.bounds.midY + 300,
                                  width: 90,
                                  height: 90)
        
        
        buttonPlus.frame = CGRect(x: view.bounds.minX + 305,
                                  y: view.bounds.midY,
                                  width: 90,
                                  height: 90)
        buttonMinus.frame = CGRect(x: view.bounds.minX + 305,
                                  y: view.bounds.midY + 100,
                                  width: 90,
                                  height: 90)
        buttonDivision.frame = CGRect(x: view.bounds.minX + 305,
                                  y: view.bounds.midY + 200,
                                  width: 90,
                                  height: 90)
        buttonMulti.frame = CGRect(x: view.bounds.minX + 305,
                                  y: view.bounds.midY + 300,
                                  width: 90,
                                  height: 90)
        buttonSmooth.frame = CGRect(x: view.bounds.minX + 205,
                                  y: view.bounds.midY + 300,
                                  width: 90,
                                  height: 90)
        buttonComma.frame = CGRect(x: view.bounds.minX + 5,
                                  y: view.bounds.midY + 300,
                                  width: 90,
                                  height: 90)
        
        labelSum.frame = CGRect(x: view.bounds.minX + 10,
                                  y: view.bounds.midY - 150,
                                width: view.bounds.maxX - 20,
                                  height: 90)
    }
    
    //MARK: Label
    private var labelSum: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 70)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.textColor = .white
        
        label.isUserInteractionEnabled = true
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
    let buttonMulti = ButtonNumbers(text: "•")
    let buttonComma = ButtonNumbers(text: ",")
    let buttonDivision = ButtonNumbers(text: "÷")
    let buttonSmooth = ButtonNumbers(text: "=")
    
    @objc private func handlerSwipe() {
        guard let text = labelSum.text, text != "0" else { return }
        
        let newText = String(text.dropLast())
        labelSum.text = newText.isEmpty ? "0" : newText
    }
    
    @objc private func one() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "1"
        } else {
            labelSum.text = numberLabel + "1"
        }
    }
    
    @objc private func two() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "2"
        } else {
            labelSum.text = numberLabel + "2"
        }
    }
    
    @objc private func three() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "3"
        } else {
            labelSum.text = numberLabel + "3"
        }
    }

    @objc private func four() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "4"
        } else {
            labelSum.text = numberLabel + "4"
        }
    }

    @objc private func five() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "5"
        } else {
            labelSum.text = numberLabel + "5"
        }
    }

    @objc private func six() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "6"
        } else {
            labelSum.text = numberLabel + "6"
        }
    }

    @objc private func seven() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "7"
        } else {
            labelSum.text = numberLabel + "7"
        }
    }

    @objc private func ehgiht() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "8"
        } else {
            labelSum.text = numberLabel + "8"
        }
    }

    @objc private func nine() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "9"
        } else {
            labelSum.text = numberLabel + "9"
        }
    }

    @objc private func zero() {
        let numberLabel = labelSum.text ?? "0"
        
        if numberLabel == "0" {
            labelSum.text = "0"
        } else {
            labelSum.text = numberLabel + "0"
        }
    }
    
    private var firstNumber: Double?
    private var currentOperation: Operation?
    private var isTypingNumber = false
    
    enum Operation {
        case add
    }
    
    @objc private func numberPressed(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        
        if labelSum.text == "0" || !isTypingNumber {
            labelSum.text = digit
            isTypingNumber = true
        } else {
            labelSum.text! += digit
        }
    }
    
    @objc private func plusPressed() {
        guard let text = labelSum.text,
              let number = Double(text) else { return }
        
        firstNumber = number
        currentOperation = .add
        isTypingNumber = false
        
        labelSum.text = "\(text) + "
    }
    
    @objc private func equalPressed() {
        guard
            let operation = currentOperation,
            let first = firstNumber,
            let text = labelSum.text,
            let second = Double(text)
        else { return }
        
        let components = text.split(separator: " ")
        guard let second = Double(components.last ?? "") else { return }
                
        let result: Double
        
        switch operation {
        case .add:
            result = first + second
        }
        labelSum.text = formatResult(result)
        
        firstNumber = nil
        currentOperation = nil
        isTypingNumber = false
    }
    private func formatResult(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(value)
        }
    }
}


#Preview {
    ViewController()
}
