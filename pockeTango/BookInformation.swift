//
//  BookInformation.swift
//  pockeTango
//
//  Created by NY on 2022/02/13.
//

import UIKit
import CoreData

class BookInformation: UIViewController {
    @IBOutlet weak var word_table: UITableView!
    var book_index: Int = 0
    let word_list = ["overwhelming"]

    public func getBook() -> UserRegisterdBook {
        return FlashCardManager.getAllFolders()[book_index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        word_table.frame = view.frame
        word_table.dataSource = self
        word_table.delegate = self
        word_table.tableFooterView = UIView(frame: .zero)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookInformation: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return word_list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = word_table.dequeueReusableCell(withIdentifier: "word_table", for: indexPath)
        cell.textLabel?.text = word_list[indexPath.row] as! String
        return cell
    }
}
extension BookInformation: UITableViewDelegate {

}
