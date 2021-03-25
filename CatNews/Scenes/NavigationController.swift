//
//  NavigationController.swift
//  CatNews
//
//  Created by Adam Young on 25/03/2021.
//

import UIKit

protocol NavigationViewable: class {
    
    var viewControllers: [UIViewController] { get set }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool)

    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    
}

typealias NavigationControlling = UINavigationController & NavigationViewable

extension UINavigationController: NavigationViewable { }
