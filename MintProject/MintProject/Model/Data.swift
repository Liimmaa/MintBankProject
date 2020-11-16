//
//  Data.swift
//  MintProject
//
//  Created by Lima on 16/11/2020.
//

import UIKit

struct  WelcomeElement: Codable {
    let commit: Commit
}

struct Commit: Codable {
    let author, committer: CommitAuthor
    let message: String
}

struct CommitAuthor: Codable {
    let name, email: String
    let date: String
}
