//
//  GithubReposRouter.swift
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

@objc protocol GithubReposRoutingLogic
{
func showDetails(with userName: String)
}

protocol GithubReposDataPassing
{
  var dataStore: GithubReposDataStore? { get }
}

class GithubReposRouter: NSObject, GithubReposRoutingLogic, GithubReposDataPassing
{
  weak var viewController: GithubReposViewController?
  var dataStore: GithubReposDataStore?
  
  // MARK: Routing
  
  func showDetails(with userName: String) {
    let storyboard = UIStoryboard(name: "ShowDetail", bundle: nil)
    let showDetailsVC = storyboard.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
    var injectionProvider = showDetailsVC.router?.injectionProvider
    injectionProvider?.name = userName
    viewController?.navigationController?.pushViewController(showDetailsVC, animated: true)
  }
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: GithubReposViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: GithubReposDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
