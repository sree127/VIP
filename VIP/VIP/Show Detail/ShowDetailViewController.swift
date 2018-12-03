//
//  ShowDetailViewController.swift
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

protocol ShowDetailDisplayLogic: class {
  /* Example:
  func displaySomething(viewModel: ShowDetail.Something.ViewModel)
  */
}

class ShowDetailViewController: UIViewController /* UICollectionViewController or UITableViewController */ {
  var interactor: ShowDetailBusinessLogic?
  var router: (NSObjectProtocol & ShowDetailRoutingLogic & ShowDetailDataPassing)?

  // MARK: IBOutlets

  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: Setup

  private func setup() {
    let viewController = self
    let interactor = ShowDetailInteractor()
    let presenter = ShowDetailPresenter()
    let router = ShowDetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.injectionProvider = interactor
  }

  // MARK: Routing

  /* Example:
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  */

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    /* Example:
    doSomething()
    */
  }

  // MARK: UserActions

  /* Example:
  func doSomething() {
    let request = ShowDetail.Something.Request()
    interactor?.doSomething(request: request)
  }
  */
}

extension ShowDetailViewController: ShowDetailDisplayLogic {

  /* Example:
  func displaySomething(viewModel: ShowDetail.Something.ViewModel) {
    //nameTextField.text = viewModel.name
  }
  */
}
