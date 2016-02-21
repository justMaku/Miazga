//
//  Stream.swift
//  Miazga
//
//  Created by Michał Kałużny on 19/02/16.
//
//

import Foundation

public typealias Byte = UInt8

public protocol Stream {
    func write(value: StreamableType)
    func read(length: Int) -> [Byte]
}
