//
//  personalDataView.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class personalDataView: UIView {
    
    public  var nameAge:    nameAgeView?
    private var label:      myLabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = myLabel(frame: CGRect(          x: 0,
                                                y: 0,
                                                width: width,
                                                height: .labelHeight),
                        with: "Персональные данные")
        
        nameAge = nameAgeView(frame: CGRect(    x: 0,
                                                y: .labelHeight,
                                                width: width,
                                                height: .formHeight))
        addSubview(nameAge!)
        addSubview(label!)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
