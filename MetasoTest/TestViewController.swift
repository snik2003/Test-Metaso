//
//  TestViewController.swift
//  MetasoTest
//
//  Created by Сергей Никитин on 13.08.2018.
//  Copyright © 2018 Sergey Nikitin. All rights reserved.
//

import UIKit

class TestViewController: UITableViewController {

    let numberCells = 50
    
    let cellIdentifier = "testCell"
    
    let defaultColor = UIColor.white
    
    var colors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        for _ in 0...numberCells-1 {
            colors.append(defaultColor)
        }
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberCells
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.backgroundColor = colors[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row)"
        
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {
            colors[indexPath.row] = setRandomColor()
            cell.backgroundColor = colors[indexPath.row]
        }
    }
    
    func setRandomColor() -> UIColor {
        
        let red = CGFloat(arc4random() % 255) / 255.0
        let green = CGFloat(arc4random() % 255) / 255.0
        let blue = CGFloat(arc4random() % 255) / 255.0
        
        return UIColor.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
