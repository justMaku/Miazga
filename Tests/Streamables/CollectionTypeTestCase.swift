//
//  CollectionTypeTestCase.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import XCTest
import Miazga

class CollectionTypeTestCase: XCTestCase {

    let stream = MemoryStream()
    
    func testRawCollection() {
        let raws: [UInt16] = [UInt16.min, 0, UInt16.max]

        stream << raws
        
        let decoded: [UInt16] = stream.read(count: raws.count)
        
        XCTAssert(raws == decoded)
    }
    
    func testPacketCollection() {
        let packets = [TestPacket(x: 1, y: 2), TestPacket(x: 3, y: 4)]
        stream << packets
        let decoded: [TestPacket] = stream.read(count: packets.count)
        
        XCTAssert(packets == decoded)
    }
 
}
