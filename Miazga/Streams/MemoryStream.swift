//
//  MemoryStream.swift
//  Miazga
//
//  Created by Michał Kałużny on 21/02/16.
//
//

import Foundation

public class MemoryStream: Stream {
    
    private var data: [Byte] = []
    private var cursor: Int = 0
    
    public init(data: [Byte] = []) {
        self.data = data
    }
    
    public func write(value: StreamableType) {
        self.write(value.data)
    }
    
    public func write<T where T: StreamableType>(values: [T]) {
        var data = [Byte]()
        for element in values {
            data.appendContentsOf(element.data)
        }
        self.write(data)
    }
    
    func write(data: [Byte]) {
        self.data += data
    }
    
    public func read(length: Int) -> [Byte] {
        let slice = data[cursor..<cursor+length]
        cursor += length
        return Array(slice)
    }
}
