// Copyright © 2018 Cheah Bee Kim. All rights reserved.
// 

import UIKit

extension UIAlertController {
    fileprivate static func controller(from error: ApiErrorMeta) -> UIAlertController {
        let alertController = UIAlertController(
            title: error.title,
            message: error.message,
            preferredStyle: .alert)
        return alertController
    }
    
    static func present(error: ApiErrorMeta, presenter: UIViewController) {
        let alert = UIAlertController.controller(from: error)
        error.actions.forEach({ alert.addAction(UIAlertAction.action(from: $0)) })
        
        if alert.actions.isEmpty { alert.addAction(UIAlertAction.closeAction())}
        
        presenter.present(alert, animated: true, completion: nil)
    }
}

extension UIAlertAction {
    fileprivate static func action(from error: ApiErrorMetaAction) -> UIAlertAction {
        let action = UIAlertAction(
            title: error.title,
            style: .default) { _ in
                if let url = error.url {
                    UIApplication.shared.open(url, options: [:])
                }
        }
        return action
    }
    
    fileprivate static func closeAction() -> UIAlertAction {
        let action = UIAlertAction(
            title: "Close",
            style: .default)
        return action
    }
}
