import Foundation

class InstanceManager {
    static private var printers: Dictionary<Int32, Epos2Printer> = [:];
    static private var nextId: Int32 = 0;
    static private func allocId() -> Int32{
        let id = nextId;
        nextId += 1
        return id;
    }

    static public func register(printer: Epos2Printer) -> Int32 {
        let id = allocId()
        printers[id] = printer
        return id
    }

    static public func release(id: Int32) -> Epos2Printer? {
        return printers.removeValue(forKey: id)
    }

    static public func printer(byId id: Int32) throws -> Epos2Printer {
        guard let printer = printers[id] else { throw LibraryError.invalidId(id: id) }

        return printer
    }

    static func allPrinters() -> Dictionary<Int32, Epos2Printer>.Values {
        return printers.values
    }

    static public func reset() {
        printers.removeAll()
        nextId = 0
    }
}
