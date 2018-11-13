//
//  APIManager.swift
//  VIP
//
//  Created by Sreejith Njamelil on 13.11.18.
//  Copyright © 2018 Sreejith Njamelil. All rights reserved.
//

import RxSwift

class APIManager {
  
  static func repositoriesBy(_ githubId: String) -> Observable<[Repository]> {
    guard !githubId.isEmpty,
      let url = URL(string: "https://api.github.com/users/\(githubId)/repos") else {
        return Observable.just([])
    }
    return URLSession.shared.rx.json(url: url).retry(3).map(parse)
  }
  
  static func parse(json: Any) -> [Repository] {
    guard let items = json as? [[String: Any]] else {
      return []
    }
    
    var repositories = [Repository]()
    
    items.forEach {
      guard let repoName = $0["name"] as? String,
        let repoURL = $0["html_url"] as? String else {
          return
      }
      repositories.append(Repository(repoName: repoName, repoURL: repoURL))
    }
    return repositories
  }
}
