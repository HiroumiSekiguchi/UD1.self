//
//  ViewController1.swift
//  UD1.self
//
//  Created by 関口大海 on 2019/06/30.
//  Copyright © 2019 関口大海. All rights reserved.
//

import UIKit

class ViewController1: UITableViewController {
    
    var itemArray = ["ご飯を食べる", "朝早く起きる", "夜は早く寝る！"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    
    
    // ☆☆☆以下、TableViewの設定☆☆☆ //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
    }
    
 


}
