//
//  Stream.swift
//  Miazga
//
//  Created by Michał Kałużny on 19/02/16.
//
//

import Foundation

public typealias Byte = UInt8

public class Stream {
    private var data: [Byte] = []
    private var cursor: Int = 0
    
    public init(data: [Byte]) {
        self.data = data
    }
}

extension Stream {
    
    func write(value: StreamableType) {
        self.write(value.data)
    }
    
    func write(data: [Byte]) {
        self.data += data
    }
    
    func read(length: Int) -> [Byte] {
        let slice = data[cursor..<cursor+length]
        cursor += length
        return Array(slice)
    }
}
