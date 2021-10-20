//
//  CustomTableViewController.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import UIKit
import SafariServices

class ReusableTable: NSObject {
    
    var articleVM: ArticleViewModel?
    
    func registerCells(forTableView tableView: UITableView) {
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func setupViewModel(vm: ArticleViewModel) {
        self.articleVM = vm
    }
}

extension ReusableTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleVM?.getRowCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell

        let articleArray = articleVM?.getArray()
        if let article = articleArray?[indexPath.row] {
            cell?.setUpCell(article: article)
        }
        return cell ?? UITableViewCell()
    }
}
