//
//  ViewController.swift
//  MintProject
//
//  Created by Lima on 16/11/2020.
//

import UIKit
import SnapKit

class ListCommitsViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, GithubCommitProtocol {

    var tableView = UITableView()
    var commitData: [WelcomeElement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .blue
        setupTableview()
        
        let githubCommitLoader = DataLoader()
        githubCommitLoader.loadDataDelegate = self
        githubCommitLoader.getData()
    }

    func setupTableview() {
        tableView.register(CommitsCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func commitData(recentCommits: [WelcomeElement]) {
        self.commitData = recentCommits
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CommitsCell
        return cell
    }
}

