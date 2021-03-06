//
//  ShowDetailModels.swift
//  VIP
//
//  Created by Sreejith Njamelil on 03.12.18.
//  Copyright (c) 2018 Sreejith Njamelil. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ShowDetail {
  // MARK: Use cases

  enum RepoStars {
    struct Request {
    }
    struct Response {
      let data: Data?
      let error: Error?
    }
    struct ViewModel {
      let starsCount: Int
    }
  }
}
