//
//  PacketTestCase.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import XCTest
import Miazga

class PacketTestCase: XCTestCase {

    let stream = MemoryStream(data: [])
    
    func testSimplePacket() {
        let packet = TestPacket(x: 12, y: 20)
        stream << packet
    
        let decodedPacket: TestPacket = stream.read()
        
        XCTAssert(packet == decodedPacket)
    }
    
    func testStringSubpacket() {
        let packet = StringSubpacket("testowy string")
        stream << packet
        
        let decodedPacket: StringSubpacket = stream.read()
        
        XCTAssert(packet.value == decodedPacket.value)
    }
    
    func testEmbededSubpacket() {
        let packet = PacketWithSubpacket(name: "testowy string", age: 21)
        stream << packet
        
        let decodedPacket: PacketWithSubpacket = stream.read()
        
        XCTAssert(packet.name == decodedPacket.name && packet.age == decodedPacket.age)
    }
}
