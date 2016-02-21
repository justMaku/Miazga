//
//  UInt32TestCase.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import XCTest

import Foundation
import Miazga

class RawStreamableTypeTestCase: XCTestCase {
    private func compare<T: RawStreamableType>(value: T) {
        let bytes = value.data
        let decoded: T = T.decode(fromData: bytes)
        XCTAssert(decoded == value)
    }
}

class UIntTestCase: RawStreamableTypeTestCase {
    func testMaxUInt() {
        compare(UInt.max)
    }
    
    func testZeroUInt() {
        compare(0 as UInt)
    }
    
    func testMinUInt() {
        compare(UInt.min)
    }
}

class UInt16TestCase: RawStreamableTypeTestCase {
    func testRandomUInt16() {
        let random: UInt16 = UInt16(arc4random_uniform(UInt32(UInt16.max)))
        compare(random)
    }
    
    func testMaxUInt16() {
        compare(UInt16.max)
    }
    
    func testZeroUInt16() {
        compare(0 as UInt16)
    }
    
    func testMinUInt16() {
        compare(UInt16.min)
    }
}

class UInt32TestCase: RawStreamableTypeTestCase {
    func testRandomUInt32() {
        let random: UInt32 = UInt32(arc4random_uniform(UInt32.max))
        compare(random)
    }
    
    func testMaxUInt32() {
        compare(UInt32.max)
    }
    
    func testZeroUInt32() {
        compare(0 as UInt32)
    }
    
    func testMinUInt32() {
        compare(UInt32.min)
    }
}

class UInt64TestCase: RawStreamableTypeTestCase {
    func testMaxUInt64() {
        compare(UInt64.max)
    }
    
    func testZeroUInt64() {
        compare(0 as UInt64)
    }
    
    func testMinUInt64() {
        compare(UInt64.min)
    }
}

class IntTestCase: RawStreamableTypeTestCase {
    func testMaxInt() {
        compare(Int.max)
    }
    
    func testZeroInt() {
        compare(0 as Int)
    }
    
    func testMinInt() {
        compare(Int.min)
    }
}

class Int16TestCase: RawStreamableTypeTestCase {
    func testRandomInt16() {
        let random: Int16 = Int16(arc4random_uniform(UInt32(Int16.max))) - Int16.max/2
        compare(random)
    }
    
    func testMaxInt16() {
        compare(Int16.max)
    }
    
    func testZeroInt16() {
        compare(0 as Int16)
    }
    
    func testMinInt16() {
        compare(Int16.min)
    }
}

class Int32TestCase: RawStreamableTypeTestCase {
    func testRandomInt32() {
        let random: Int32 = Int32(arc4random_uniform(UInt32(Int32.max))) - Int32.max/2
        compare(random)
    }
    
    func testMaxInt32() {
        compare(Int32.max)
    }
    
    func testZeroInt32() {
        compare(0 as Int32)
    }
    
    func testMinInt32() {
        compare(Int32.min)
    }
}

class Int64TestCase: RawStreamableTypeTestCase {
    func testMaxInt64() {
        compare(Int64.max)
    }
    
    func testZeroInt64() {
        compare(0 as Int64)
    }
    
    func testMinInt64() {
        compare(Int64.min)
    }
}
