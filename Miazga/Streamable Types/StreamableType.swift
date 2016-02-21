//
//  StreamableType.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import Foundation

public protocol StreamableType {
    var data: [Byte] { get }
    static func decode(fromData data: [Byte]) -> Self
}

public func << (left: Stream, right: StreamableType) { left.write(right) }
