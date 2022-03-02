//
//  changeChildren.swift
//  alef
//
//  Created by Yegor Geronin on 01.03.2022.
//

import Foundation
import UIKit

class changeChildrenArrayClass {
    public weak var tableView:      childrenTableView?
    public weak var personalView:   personalDataView?
    
    @objc
    func addChild( _ button : UIButton) {
        guard let tableView = tableView else {
            print("Table isnt set!")
            return
        }
        children.append(tableView.createNewCell())
        tableView.reloadData()
        if children.count > 4 {
            tableView.visibilityButton = false
        }
    }
    
    @objc
    func removeChild( _ button : myDeleteButton) {
        guard let cell = button.cell else {
            print("Button doesnt have cell ref!")
            return
        }
        guard let tableView = tableView else {
            print("Table isnt set!")
            return
        }
        if let deletionIndexPath = tableView.table.indexPath(for: cell) {
            tableView.visibilityButton = true
            children.remove(at: deletionIndexPath.row)
            tableView.table.deleteRows(at: [deletionIndexPath], with: .left)
        }
        
    }
    
    func cleanAll() {
        clearData()
        guard let naPersonal = personalView?.nameAge,
              let table = tableView else {
                  print("Here... only God could help us!")
                  return
              }
        naPersonal.ClearData()
        table.reloadData()
        table.visibilityButton = true
    }
}

struct Presenter {
    public static let childrenClass = changeChildrenArrayClass()
}
