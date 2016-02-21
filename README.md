# Miazga
Miazga is a small library which main purpose is to provide a simple and easy to use way of reading and writing data from/to binary streams.

# Usage

Writing:

```swift
    let stream = MemoryStream(data: [])
    stream << UInt32(21) // Age
    stream << "Michał Kałużny"
```

Reading:

```swift
    let age: UInt32 = stream.read()
    let name: String = stream.read(length: 14) // Length is required for reading strings)
```

### Packets
Along writing and reading raw data, Miazga also has support for packets:

Example:
```swift
struct PingPacket: Packet {
    
    let timestamp: UInt32
    let index: UInt8
    
    static func decode(fromStream stream: Stream) -> PacketWithSubpacket {
        let timestamp: UInt32 = stream.read()
        let index: UInt8 = stream.read()
        
        return PingPacket(timestamp: timestamp, index: index)
    }
    
    func map() -> [StreamableType] {
        return [timestamp, index]
    }
}

let packet = PingPacket(timestamp: 0, index: 0)
stream << packet

let incomingPacket: PingPacket = stream.read()
```

### Supported Type of stream
At the moment Miazga has only one built-in stream type: MemoryStream which uses a simple byte array as a backing storage. New types of streams can be easilly added by conforming to the `Stream` protocol.

### Supported Types

By default Miazga support only a handfull of base types from Swift Standard Library:

* String
* UInt, UInt8, UInt16, UInt32, UInt64
* Int, Int8, Int16, Int32, Int64

This can be extended by conforming to the `StreamableType` protocol.

# Installation

Miazga can be installed by either Carthage or CocoaPods

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

**:warning: IMPORTANT! For tvOS support CocoaPods `0.39` is required. :warning:**

```
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod "Miazga", :git => ':git => 'https://github.com/justMaku/Miazga.git'
end
```

replace `YOUR_TARGET_NAME`, then type in the `Podfile` directory:

```
$ pod install
```

### [Carthage](https://github.com/Carthage/Carthage)

**Xcode 7.1 required**

Add this to `Cartfile`

```
github "justMaku/Miazga" ~> 1.0
```

```
$ carthage update
```

# About the name
[Miazga](https://pl.wikipedia.org/wiki/Miazga_(rzeka)) is a small river flowing through an area where I used to live as a kid. Even though it's really small and name is only recognized by locals, it provided all the kids in the area with plenty of fun I believe it reflects the nature of this project perfectly. 
