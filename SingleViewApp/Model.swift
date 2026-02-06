//
//  Model.swift
//  SingleViewApp
//
//  Created by Шамиль Хоролов on 05.02.2026.
//

import UIKit

//MARK: Buttons
open class ButtonNumbers: UIButton {
    public init(text: String) {
        super.init(frame: .zero)
        setupButton(text: text)
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    public func setupButton(text: String) {
        setTitle(text, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 50)
        backgroundColor = .systemGray2
        tintColor = .white
        layer.cornerRadius = 45
        
    }
    open func updateText(_ newText: String) {
        setTitle(newText, for: .normal)
    }
    open func updateBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }
}


