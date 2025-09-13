import OSLog

extension Logger {
    static let subsystem = "com.swiftgodotkit"

    @available(iOS 14.0, *)
    static let Window = Logger(subsystem: subsystem, category: "Window")

    @available(iOS 14.0, *)
    static let App = Logger(subsystem: subsystem, category: "App")
}
