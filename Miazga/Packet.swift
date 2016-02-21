//
//  Packet.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import Foundation

public protocol Packet: StreamableType {
    static func decode(fromStream stream: Stream) -> Self
    func map() -> [StreamWriteableType]
}

public extension Packet {
    var data: [Byte] {
        get {
            var packetData = [Byte]()
            for value in self.map() {
                let valueData = value.data
                packetData.appendContentsOf(valueData)
            }
            
            return packetData
        }
    }
}

public extension Packet {
    static func decode(fromData data: [Byte]) -> Self {
        let stream = MemoryStream(data: data)
        let packet = self.decode(fromStream: stream)
        return packet
    }
}

extension Stream {
    public func read<T: Packet>() -> T {
        let packet = T.decode(fromStream: self)
        return packet
    }
    
    public func read<T: Packet>(count count: Int) -> [T] {
        var packets = [T]()
        
        for _ in 0..<count {
            let packet: T = self.read()
            packets.append(packet)
        }
        
        return packets
    }
}

extension Array: StreamWriteableType {
    public var data: [Byte] {
        get {
            var collectionData = [Byte]()
            for value in self {
                if let value = value as? StreamWriteableType {
                    let valueData = value.data
                    collectionData.appendContentsOf(valueData)
                }
            }
            
            return collectionData
        }
    }
}
