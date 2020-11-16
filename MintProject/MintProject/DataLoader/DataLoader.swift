//
//  DataLoader.swift
//  MintProject
//
//  Created by Lima on 16/11/2020.
//

import UIKit

class DataLoader {
    
    var loadDataDelegate: GithubCommitProtocol?
    
    public func getData() {
        let url = "https://api.github.com/repos/rails/rails/commits"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response,error in
            guard let data = data, error == nil else {
                return
            }
            var result: [WelcomeElement]?
            do{
                result = try JSONDecoder().decode([WelcomeElement].self, from: data)
            }
            catch {
                print("failed to convert \(error)")
            }
            guard let json = result else {
                return
            }
            self.loadDataDelegate?.commitData(recentCommits: json)
        })
        
        task.resume()
    }
}

