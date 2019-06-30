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

    
    
    // ☆☆☆以下、追加ボタン（基礎文法）☆☆☆ //
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        // アラートの宣言
        let alert = UIAlertController(title: "新規項目の追加", message: "", preferredStyle: .alert)
        
        // スコープ共通のTextField
        var textField = UITextField()
        
        // アラートにTextFieldを追加
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "新規項目を追加して下さい"
            textField = alertTextField
        }
        
        // アクションの宣言
        let action = UIAlertAction(title: "追加", style: .default) { (action) in
            self.itemArray.append(textField.text ?? "項目は追加されませんでした")
            
            // テーブルビューのリロード
            self.tableView.reloadData()
            
        }
        
        // alertにactionを追加
        alert.addAction(action)
        
        // 表示
        present(alert, animated: true, completion: nil)
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // タップしたセルを非選択に戻す
        tableView.deselectRow(at: indexPath, animated: true)
        
        // タップしたセルのチェックを付けたり外したりする
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // なぜかリファクタリングできない↑...
        
        // 忘れずリロード！
//        tableView.reloadData()
        
        
    }
 


}
