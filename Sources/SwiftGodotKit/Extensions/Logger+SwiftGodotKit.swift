import OSLog

import OSLog

/// A unified logger that works on iOS 13 and 14+
struct AppLogger {
    private let subsystem: String
    private let category: String

    init(subsystem: String, category: String) {
        self.subsystem = subsystem
        self.category = category
    }

    func log(_ message: String) {
        if #available(iOS 14.0, *) {
            let logger = Logger(subsystem: subsystem, category: category)
            logger.info("\(message, privacy: .public)")
        } else {
            os_log("%@", log: OSLog(subsystem: subsystem, category: category), type: .info, message)
        }
    }

    func error(_ message: String) {
        if #available(iOS 14.0, *) {
            let logger = Logger(subsystem: subsystem, category: category)
            logger.error("\(message, privacy: .public)")
        } else {
            os_log("%@", log: OSLog(subsystem: subsystem, category: category), type: .error, message)
        }
    }
}

extension AppLogger {
    static let subsystem = "com.swiftgodotkit"

    static let Window = AppLogger(subsystem: subsystem, category: "Window")
    static let App = AppLogger(subsystem: subsystem, category: "App")
}
