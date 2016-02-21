//
//  StreamReadableType.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation

public protocol StreamReadableType {
    static func decode(fromData data: [Byte]) -> Self
}