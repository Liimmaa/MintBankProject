//
//  CommitsCell.swift
//  MintProject
//
//  Created by Lima on 16/11/2020.
//

import UIKit

class CommitsCell: UITableViewCell {
    
    var cellView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView(){
        contentView.addSubview(cellView)
        cellView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cellView.layer.cornerRadius = 10
        cellView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
}
