//
//  ViewController1.swift
//  UD1.self
//
//  Created by 関口大海 on 2019/06/30.
//  Copyright © 2019 関口大海. All rights reserved.
//

// Firebase用に新しいブランチの作成

import UIKit

class ViewController1: UITableViewController {
    
    // UDを使用するための宣言
    let defaults = UserDefaults.standard
    
    var item = Item()
    
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期値の設定
        var item1 = Item()
        item1.content = "ご飯を食べる"
        itemArray.append(item1)
        
        var item2 = Item()
        item2.content = "朝早く起きる"
        itemArray.append(item2)
        
        var item3 = Item()
        item3.content = "夜は早く寝る！"
        itemArray.append(item3)
        
//        // itemArrayをUD内のデータから取得
//        if let items = defaults.object(forKey: "test") as? [String] {
//            itemArray = items
//        }
        
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
            
            var newItem = Item()
            newItem.content = textField.text ?? "項目は追加されませんでした"
            newItem.checked = false // デフォルト
            
            self.itemArray.append(newItem)
            
            // UD内に配列を保存９
            self.defaults.set(self.itemArray, forKey: "test")
            
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

        cell.textLabel?.text = itemArray[indexPath.row].content
        
        let itemy = itemArray[indexPath.row]
        
        // itemのcheckedの真偽によってチェックマークを着け外す
//        if item.checked == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        // 上記をリファクタリング
        
        cell.accessoryType = itemy.checked ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // タップしたセルを非選択に戻す
        tableView.deselectRow(at: indexPath, animated: true)
        
//        // タップしたセルのチェックを付けたり外したりする
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
//        // なぜかリファクタリングできない↑...
        
        // itemのcheckedの真偽によってチェックマークを着け外す
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        
        tableView.reloadData()
 
    }

}
