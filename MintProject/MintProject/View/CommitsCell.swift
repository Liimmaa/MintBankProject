//
//  CommitsCell.swift
//  MintProject
//
//  Created by Lima on 16/11/2020.
//

import UIKit

class CommitsCell: UITableViewCell {
    
    var cellView = UIView()
    var authorNameLabel = UILabel()
    var authorEmailLabel = UILabel()
    var date = UILabel()
    var commitMessageView = UIView()
    var commitMessage = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.6914861981, green: 0, blue: 0.05811308865, alpha: 1)
        setupCellView()
        setupAuthorNameLabel()
        setupAuthorEmailLabel()
        setupDate()
        setupCommitMessageView()
        setupCommitMessage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(CommitCellConstants.fatalError)
    }
    
    func setupCellView(){
        contentView.addSubview(cellView)
        cellView.backgroundColor = #colorLiteral(red: 0.632277759, green: 0, blue: 0.05313716103, alpha: 1)
        cellView.layer.cornerRadius = 10
        cellView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    func setupAuthorNameLabel() {
        cellView.addSubview(authorNameLabel)
        authorNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        authorNameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        authorNameLabel.numberOfLines = 0
        authorNameLabel.textAlignment = .center
        authorNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cellView.snp.top).offset(10)
            make.height.equalTo(20)
            make.centerX.equalTo(cellView)
        }
    }
    
    func setupAuthorEmailLabel() {
        cellView.addSubview(authorEmailLabel)
        authorEmailLabel.font = UIFont.systemFont(ofSize: 15)
        authorEmailLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        authorEmailLabel.numberOfLines = 0
        authorEmailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorNameLabel.snp.bottom).offset(8)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.height.equalTo(20)
        }
    }
    
    func setupDate() {
        cellView.addSubview(date)
        date.font = UIFont.systemFont(ofSize: 15)
        date.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        date.numberOfLines = 0
        date.snp.makeConstraints { (make) in
            make.top.equalTo(authorEmailLabel.snp.bottom).offset(5)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.height.equalTo(20)
        }
    }
    
    func setupCommitMessageView() {
        cellView.addSubview(commitMessageView)
        commitMessageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        commitMessageView.layer.cornerRadius = 5
        commitMessageView.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(10)
            make.left.equalTo(cellView.snp.left).offset(10)
            make.right.equalTo(cellView.snp.right).offset(-10)
            make.bottom.equalTo(cellView.snp.bottom).offset(-20)
        }
    }
    
    func setupCommitMessage() {
        commitMessageView.addSubview(commitMessage)
        commitMessage.font = UIFont.systemFont(ofSize: 14)
        commitMessage.textColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        commitMessage.numberOfLines = 0
        commitMessage.snp.makeConstraints { (make) in
            make.top.equalTo(commitMessageView.snp.top).offset(5)
            make.left.equalTo(commitMessageView.snp.left).offset(10)
            make.right.equalTo(commitMessageView.snp.right).offset(-10)
            make.bottom.equalTo(commitMessageView.snp.bottom).offset(-10)
        }
    }
}
