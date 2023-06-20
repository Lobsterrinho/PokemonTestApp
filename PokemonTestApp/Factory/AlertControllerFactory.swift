//
//  AlertControllerFactory.swift
//  PokemonTestApp
//
//  Created by Lobster on 7.05.23.
//

import UIKit

final class AlertControllerFactory: AlertFactoryProtocol {
    
    private enum Const {
        static let cancel: String = "Cancel"
    }
    
    typealias AlertActionHandler = () -> Void
    
    enum AlertAction {
        case `default`(String, AlertActionHandler?)
        case cancel(AlertActionHandler?)
        case destructive(String, AlertActionHandler?)
    }
    
    func makeAlert(title: String?,
                   message: String?,
                   actions: [AlertAction]) -> UIAlertController {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
        return makeAlertController(alertVC: alertVC, actions: actions)
    }
    
    func makeActionSheet(title: String?,
                         message: String?,
                         actions: [AlertAction]) -> UIAlertController {
        let alertVC = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .actionSheet)
        return makeAlertController(alertVC: alertVC, actions: actions)
    }
    
    private func makeAlertController(
        alertVC: UIAlertController,
                                     actions: [AlertAction]
    ) -> UIAlertController {
        actions.forEach { alertAction in
            switch alertAction {
            case .default(let title,
                          let handler):
                alertVC.addAction(
                    UIAlertAction(title: title,
                                  style: .default) { _ in
                        handler?()
                        alertVC.dismiss(animated: true)
                    }
                )
            case .cancel(let handler):
                alertVC.addAction(
                    UIAlertAction(title: Const.cancel,
                                  style: .cancel) { _ in
                        handler?()
                        alertVC.dismiss(animated: true)
                    }
                )
            case .destructive(let title,
                              let handler):
                alertVC.addAction(
                    UIAlertAction(title: title,
                                  style: .destructive) { _ in
                        handler?()
                        alertVC.dismiss(animated: true)
                    }
                )
            }
        }
        
        return alertVC
    }
}
