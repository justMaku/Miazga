//
//  RawStreamableType.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import Foundation

public protocol RawStreamableType: StreamableType, Equatable, Comparable {
}

extension RawStreamableType {
    public var data: [Byte] {
        get {
            var mutableSelf = self
            let bytes = withUnsafeMutablePointer(&mutableSelf) { (let pointer) -> [Byte] in
                let size = sizeof(Self)
                let data = NSData(bytes: pointer, length: size)
                var array = [Byte](count: size, repeatedValue: 0)
                data.getBytes(&array, length: size)
                return array
            }
            return bytes
        }
    }
}

extension UInt: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> UInt {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<UInt>(data.bytes)
        let value = UInt(pointer.memory)
        return value
    }
}

extension UInt8: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> UInt8 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<UInt8>(data.bytes)
        let value = UInt8(pointer.memory)
        return value
    }
}

extension UInt16: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> UInt16 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<UInt16>(data.bytes)
        let value = UInt16(pointer.memory)
        return value
    }
}

extension UInt32: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> UInt32 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<UInt32>(data.bytes)
        let value = UInt32(pointer.memory)
        return value
    }
}

extension UInt64: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> UInt64 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<UInt64>(data.bytes)
        let value = UInt64(pointer.memory)
        return value
    }
}

extension Int: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> Int {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<Int>(data.bytes)
        let value = Int(pointer.memory)
        return value
    }
}

extension Int8: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> Int8{
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<Int8>(data.bytes)
        let value = Int8(pointer.memory)
        return value
    }
}

extension Int16: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> Int16 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<Int16>(data.bytes)
        let value = Int16(pointer.memory)
        return value
    }
}

extension Int32: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> Int32 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<Int32>(data.bytes)
        let value = Int32(pointer.memory)
        return value
    }
}

extension Int64: RawStreamableType {
    public static func decode(fromData data: [Byte]) -> Int64 {
        let data = NSData(bytes: data, length: data.count)
        let pointer = UnsafePointer<Int64>(data.bytes)
        let value = Int64(pointer.memory)
        return value
    }
}

public extension Stream {
    func read<T: RawStreamableType>() -> T { return T.decode(fromData: self.read(sizeof(T))) }
}