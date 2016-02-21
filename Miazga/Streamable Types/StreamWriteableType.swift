//
//  StreamWriteableFile.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation

public protocol StreamWriteableType {
    var data: [Byte] { get }
}

public func << (left: Stream, right: StreamWriteableType) { left.write(right) }
public func << <T: StreamWriteableType>(left: Stream, right: [T]) { left.write(right) }

