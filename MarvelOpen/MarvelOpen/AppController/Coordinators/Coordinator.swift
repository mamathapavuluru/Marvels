//
//  Coordinator.swift
//  MarvelOpen
//
//  Created by Mamatha on 06/05/22.
//

import Foundation
import UIKit


protocol CoordinatorDelegate: AnyObject {
    
}

protocol Coordinator: CoordinatorDelegate {
    var delegate: CoordinatorDelegate? { get }
    var childs: [Coordinator] { get set }
    func start()
}

