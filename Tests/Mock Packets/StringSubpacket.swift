//
//  StringSubpacket.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation
import Miazga

struct StringSubpacket: Packet {
    
    let length: UInt32
    let value: String
    
    init(_ value: String) {
        self.length = UInt32(value.characters.count)
        self.value = value
    }
    
    static func decode(fromStream stream: Stream) -> StringSubpacket {
        let length: UInt32 = stream.read()
        let value: String = stream.read(Int(length))
        
        return StringSubpacket(value)
    }
    
    func map() -> [StreamWriteableType] {
        return [length, value]
    }
}
