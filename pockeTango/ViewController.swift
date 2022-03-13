//
//  ViewController.swift
//  pockeTango
//
//  Created by NY on 2022/02/13.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var folder_table: UITableView!
    var selected_book_index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "単語帳"
        
        FlashCardManager.registerNewBook(foldername: "newbook")
        FlashCardManager.save()
        
        folder_table.frame = view.frame
        folder_table.dataSource = self
        folder_table.delegate = self
        folder_table.tableFooterView = UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected_book_index = indexPath.row
        // performSegue(withIdentifier: "toBookInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "toBookInfo") {
                let secondVC = segue.destination as! BookInformation
                secondVC.book_index = self.selected_book_index
            }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FlashCardManager.getAllFoldersName().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = folder_table.dequeueReusableCell(withIdentifier: "book_list", for: indexPath)
        cell.textLabel?.text = FlashCardManager.getAllFoldersName()[indexPath.row]
        return cell
    }
}
extension ViewController: UITableViewDelegate {

}
