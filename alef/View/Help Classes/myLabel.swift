//
//  myLabel.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class myLabel: UILabel {
    
    init(frame: CGRect, with textLabel: String) {
        super.init(frame: frame)
        text = textLabel
        font = .systemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    /*
    public func CreateLable(labelText: String, widthMulti: CGFloat = 1.0) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: width * widthMulti,
                                          height: .labelHeight))
        label.text = labelText
        label.font = .systemFont(ofSize: 20)
        return label
    }
     */
}
