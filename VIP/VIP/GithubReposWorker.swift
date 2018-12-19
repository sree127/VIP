//
//  GithubReposWorker.swift
//  VIP
//
//  Created by Sreejith Njamelil on 14.11.18.
//  Copyright (c) 2018 Sreejith Njamelil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift

class GithubReposWorker {
  
  func repositoriesBy(_ githubId: String?) -> Single<[[String: Any]]> {
    guard let githubId = githubId,
      !githubId.isEmpty,
      let url = URL(string: "https://api.github.com/users/\(githubId)/repos") else {
        return Single.just([])
    }
    return URLSession.shared.rx
      .json(url: url)
      .materialize()
      .map(parse)
      .asSingle()
  }
  
  func parse(json: Any) -> [[String: Any]] {
    guard let items = json as? [[String: Any]] else {
      return []
    }
    return items
  }
}
