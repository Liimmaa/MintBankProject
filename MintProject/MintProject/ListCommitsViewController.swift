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
    var titleView = UIView()
    var imageView = UIImageView()
    var commitData: [WelcomeElement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupTitleview()
        setupImageView()
        setupTableview()
        
        let githubCommitLoader = DataLoader()
        githubCommitLoader.loadDataDelegate = self
        githubCommitLoader.getData()
    }
    
    func setupTitleview() {
        view.addSubview(titleView)
        titleView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(50)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
    }
    
    func setupImageView(){
        titleView.addSubview(imageView)
        imageView.backgroundColor = #colorLiteral(red: 0.9505546704, green: 0.9505546704, blue: 0.9505546704, alpha: 1)
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "ruby2")
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView)
            make.left.equalTo(titleView)
            make.right.equalTo(titleView)
            make.bottom.equalTo(titleView)
        }
    }

    func setupTableview() {
        tableView.register(CommitsCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
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
        return commitData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CommitsCell
        let path = commitData?[indexPath.row]
        cell?.authorNameLabel.text = path?.commit.author.name
        cell?.authorEmailLabel.text = path?.commit.author.email
        cell?.date.text = path?.commit.author.date
        cell?.commitMessage.text = path?.commit.message
        
        return cell ?? UITableViewCell()
    }
}

