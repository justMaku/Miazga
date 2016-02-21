//
//  String.swift
//  Miazga
//
//  Created by Michał Kałużny on 20/02/16.
//
//

import Foundation

extension String: StreamableType {
    public var data: [Byte] {
        get {
            return Array(self.cStringUsingEncoding(NSUTF8StringEncoding)!.map { return Byte($0) }.dropLast()) // CString has a zero as a pad at the end.
        }
    }
    
    public static func decode(fromData data: [Byte]) -> String {
        let data = NSData(bytes: data, length: data.count)
        let string = NSString(data: data, encoding: NSUTF8StringEncoding)!
        
        return String(string)
    }
}

public extension Stream {
    func read(lenght: Int) -> String {
        let bytes: [Byte] = self.read(lenght)
        return String.decode(fromData: bytes)
    }
}
