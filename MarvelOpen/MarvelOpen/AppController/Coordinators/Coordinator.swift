//
//  Coordinator.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation
import UIKit


protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidFinish(_ coordinator: Coordinator)
}

protocol Coordinator: CoordinatorDelegate {
    var delegate: CoordinatorDelegate? { get }
    var childs: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func disposeChildren(_ child: Coordinator?) {
        for (index, coordinator) in childs.enumerated() {
            guard coordinator === child else { continue }
            childs.remove(at: index)
        }
    }

    func coordinatorDidFinish(_ coordinator: Coordinator) {
        disposeChildren(coordinator)
    }
}

