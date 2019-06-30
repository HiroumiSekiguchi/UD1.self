//
//  ViewController1.swift
//  UD1.self
//
//  Created by 関口大海 on 2019/06/30.
//  Copyright © 2019 関口大海. All rights reserved.
//

/*
 UDに関する考察
 ・itemArrayはUDに保存できない
 ・itemContentとitemCheckedに分ける
 取り出して代入より先に保存を行う
 ・最終的には再びitemArrayに格納する
 /
 itemArrayに入れるのは相変わらずItemのインスタンスでいい。UDに保存するのが上の二点。
 ・itemArrayはUDで保存しない（というかできない）
 
 
 */

import UIKit

class ViewController1: UITableViewController {
    
    // UDを使用するための宣言
    let defaults = UserDefaults.standard
    
    var item = Item()
    
    var itemArray = [Item]()
//    var itemNums = [Int]()
    var itemContents = [String]()
    var itemCheckeds = [Bool]()
    var count = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初期値の設定
        let item1 = Item()
        item1.content = "ご飯を食べる"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.content = "朝早く起きる"
        itemArray.append(item2)
        
        let item3 = Item()
        item3.content = "夜は早く寝る！"
        itemArray.append(item3)
        
//        // itemArrayをUD内のデータから取得
//        if let items = defaults.object(forKey: "test") as? [String] {
//            itemArray = items
//        }
        
        // itemContentsとitemCheckedsの値をUD内から取得
        if let iC = defaults.object(forKey: "itemContents") as? [String] {
            itemContents = iC
        }
        if let iCC = defaults.object(forKey: "itemCheckeds") as? [Bool] {
            itemCheckeds = iCC
        }
        
    }
    
    
    
    
    //////// ☆☆☆以下、追加ボタン（基礎文法）☆☆☆ ////////
    
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
            
            // 追加項目の2要素の宣言
            let itemContent = textField.text ?? "項目は追加されませんでした"
            let itemChecked = false // デフォルト
            
            // 追加項目の宣言と値の代入
            let newItem = Item()
//            newItem.content = itemContent
//            newItem.checked = itemChecked
            
            // 配列に追加
            self.itemContents.append(itemContent)
            self.itemCheckeds.append(itemChecked)
            self.itemArray.append(newItem)
            self.count += 1
            
            // UD内に配列を保存
            self.defaults.set(self.itemContents, forKey: "itemContents")
            self.defaults.set(self.itemCheckeds, forKey: "itemCheckeds")
            self.defaults.set(self.count, forKey: "countitemCheckeds")
            
            // テーブルビューのリロード
            self.tableView.reloadData()
            
        }
        
        // alertにactionを追加
        alert.addAction(action)
        
        // 表示
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    //////// ☆☆☆以下、TableViewの設定☆☆☆ //////////
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let itemy = itemArray[indexPath.row]
        
        // itemArrayのそのセル番目のitemに二つの値を取ってきて代入
        itemy.content = itemContents[indexPath.row]
        itemy.checked = itemCheckeds[indexPath.row]

        cell.textLabel?.text = itemy.content
        
        // itemのcheckedの真偽によってチェックマークを付け外す

        cell.accessoryType = itemy.checked ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // タップしたセルを非選択に戻す
        tableView.deselectRow(at: indexPath, animated: true)
        
        // タップしたセルのitemの「checked」プロパティを付け替える
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        
        tableView.reloadData()
 
    }

}
