//
//  childrenTableView.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import UIKit

class childrenTableView: UIView {
    
    private var addButton: UIButton!
    public  var table: UITableView!
    public  var visibilityButton: Bool = true {
        didSet {
            addButton.isHidden = !visibilityButton
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CreateTable()
    }

    private func CreateTable() {
        
        // MARK: Create header
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: width,
                                          height: .labelHeight))
        
        let label = myLabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: width * 0.4,
                                          height: .labelHeight),
                            with: "Дети (макс. 5)")
        
        addButton = UIButton(frame:CGRect(x: width * 0.4,
                                          y: 0,
                                          width: width * 0.6,
                                          height: .labelHeight))
        
        addButton.layer.borderColor     = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth     = 2
        addButton.layer.cornerRadius    = addButton.height / 2
        let plusHeigth = 0.175 * addButton.width
        let widthOffset = addButton.width * 0.05
        
        let plus = UIImageView(frame: CGRect(x:  widthOffset ,
                                             y: (addButton.height -  plusHeigth) / 2,
                                             width: plusHeigth,
                                             height: plusHeigth))
        plus.image = UIImage(systemName: "plus")
        plus.contentMode = .center
        
        let labelButton = UILabel(frame: CGRect(x: plusHeigth + widthOffset,
                                                y: (addButton.height -  plusHeigth) / 2,
                                                width: addButton.width - plusHeigth - widthOffset * 2,
                                                height: plusHeigth))
        labelButton.text        = "Добавить ребенка"
        labelButton.textColor   = .systemBlue
        
        addButton.addSubview(labelButton)
        addButton.addSubview(plus)
        
        addButton.addTarget(Presenter.childrenClass,
                            action: #selector(Presenter.childrenClass.addChild(_:)),
                            for: .touchUpInside)
        
        // MARK: Create table
        table = UITableView(frame: CGRect(x: 0,
                                          y: header.bottom,
                                          width: width,
                                          height: height - header.bottom))
        table.delegate          = self
        table.dataSource        = self
        table.allowsSelection   = false
        table.backgroundColor   = .white
        
        
        header.addSubview(addButton)
        header.addSubview(label)
        
        addSubview(header)
        addSubview(table)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: Set table delegates

extension childrenTableView: UITableViewDelegate, UITableViewDataSource {
    
    func reloadData() {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .formHeight * 1.2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return children.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return children[indexPath.row]
    }
    
    func createNewCell() -> myTableCell {
        let tabelCell = myTableCell()
        let naView = nameAgeView(frame: CGRect(x: 0,
                                               y: .formHeight * 0.1,
                                               width: width,
                                               height: .formHeight),
                                 deleteButton: true)
        naView.delete?.cell = tabelCell
        tabelCell.backgroundColor = .white
        tabelCell.contentView.addSubview(naView)
        return tabelCell
    }
    
}
