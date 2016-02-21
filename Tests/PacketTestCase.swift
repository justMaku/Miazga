//
//  PacketTestCase.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import XCTest
import Miazga

struct TestPacket: Packet {
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
    
    func map() -> [StreamableType] {
        return [length, value]
    }
}

struct PacketWithSubpacket: Packet {
    
    let name: String
    let age: UInt8
    
    static func decode(fromStream stream: Stream) -> PacketWithSubpacket {
        let name: StringSubpacket = stream.read()
        let age: UInt8 = stream.read()
        
        return PacketWithSubpacket(name: name.value, age: age)
    }
    
    func map() -> [StreamableType] {
        return [StringSubpacket(name), age]
    }
}

class PacketTestCase: XCTestCase {

    let stream = Stream(data: [])
    
    func testSimplePacket() {
        let packet = TestPacket(x: 12, y: 20)
        stream << packet
    
        let decodedPacket: TestPacket = stream.read()
        
        XCTAssert(packet.x == decodedPacket.x && packet.y == decodedPacket.y)
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
