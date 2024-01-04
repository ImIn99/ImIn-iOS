//
//  Array+Extensions.swift
//  ProjectDescriptionHelpers
//
//  Created by grogiar _ on 1/3/24.
//

import Foundation

extension Array {
    func appending(_ element: Element) -> Self {
        var new = self
        new.append(element)
        return new
    }
}
