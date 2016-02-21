//
//  PacketWithSubpacket.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation
import Miazga

struct PacketWithSubpacket: Packet {
    
    let name: String
    let age: UInt8
    
    static func decode(fromStream stream: Stream) -> PacketWithSubpacket {
        let name: StringSubpacket = stream.read()
        let age: UInt8 = stream.read()
        
        return PacketWithSubpacket(name: name.value, age: age)
    }
    
    func map() -> [StreamWriteableType] {
        return [StringSubpacket(name), age]
    }
}
