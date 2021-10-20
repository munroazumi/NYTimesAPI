//
//  ViewController.swift
//  NYTimesAPI
//
//  Created by Munro Azumi on 10/15/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var customReusableTable = ReusableTable()
    let articleVM = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpTable()
        setUpNavBar()
        loadTableWithData()
    }
    
    func setUpTable() {
        tblView.delegate = self
        self.tblView.dataSource = customReusableTable
        customReusableTable.registerCells(forTableView: self.tblView)
        customReusableTable.setupViewModel(vm: self.articleVM)
    }
    
    func setUpNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "NY Times Top Stories"
    }
    
    func loadTableWithData() {
        articleVM.get {
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }
    }
    
    func openLink(url: URL) {
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articleVM.getArray()[indexPath.row]
        let articleUrl = article.url
        openLink(url: URL(string: articleUrl)!)
    }
}
