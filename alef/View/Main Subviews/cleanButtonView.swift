//
//  cleanButton.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class cleanButtonView: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth       = 2
        layer.borderColor       = UIColor.red.cgColor
        layer.cornerRadius      = frame.height / 2
        
        setTitle("Очистить", for: .normal)
        setTitleColor(.red, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
