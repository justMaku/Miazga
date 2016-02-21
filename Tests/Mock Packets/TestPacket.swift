//
//  TestPacket.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation
import Miazga

struct TestPacket: Packet, Equatable {
    let x: UInt32
    let y: UInt32
    
    static func decode(fromStream stream: Stream) -> TestPacket {
        let x: UInt32 = stream.read()
        let y: UInt32 = stream.read()
        
        return TestPacket(x: x, y: y)
    }
    
    func map() -> [StreamableType] {
        return [x, y]
    }

}

func ==(lhs: TestPacket, rhs: TestPacket) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}