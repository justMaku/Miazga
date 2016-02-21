//
//  PacketWithCollection.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation
import Miazga

struct PacketWithCollection: Packet, Equatable {
    
    let numberOfElements: UInt32
    let elements: [UInt32]
    
    init(elements: [UInt32]) {
        self.elements = elements
        self.numberOfElements = UInt32(elements.count)
    }
    
    static func decode(fromStream stream: Stream) -> PacketWithCollection {
        let numberOfElements: UInt32 = stream.read()
        let elements: [UInt32] = stream.read(count: Int(numberOfElements))
    
        return PacketWithCollection(elements: elements)
    }
    
    func map() -> [StreamWriteableType] {
        return [numberOfElements, elements]
    }
    
}

func ==(lhs: PacketWithCollection, rhs: PacketWithCollection) -> Bool {
    return lhs.elements == rhs.elements
}