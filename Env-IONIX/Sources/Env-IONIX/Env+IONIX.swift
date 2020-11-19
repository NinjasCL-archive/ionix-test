// This could be improved
// https://thoughtbot.com/blog/let-s-setup-your-ios-environments

import Foundation

public protocol Endpoints {
    var menus: URLComponents { get }
    var search: URLComponents { get }
}

public protocol Env {
    var id: String { get }
    var name: String { get }
    var DESKey: String { get }
    var endpoints: Endpoints { get }
}

public class EndpointsDev: Endpoints {
    public var menus: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonbase.com"
        components.path = "/cl.ninjas/ionix"
        return components
    }

    public var search: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "sandbox.ionix.cl"
        components.path = "/test-tecnico/search"
        return components
    }
}

public class Dev: Env {
    public let id: String = "dev"
    public let name: String = "Development Environment"
    public let DESKey: String = "ionix123456"
    public let endpoints: Endpoints = EndpointsDev()
}

public final class Environment {
    public static let dev = Dev()
    public static let staging = Dev()
    public static let production = Dev()
    public static let testing = Dev()

    public static var current = dev

    public enum EnvType {
        case dev
        case staging
        case production
        case testing
    }

    public static func boot(_ type: EnvType = .dev) {
        print("Using \(type) environment")

        switch type {
        case .dev:
            Environment.current = Environment.dev
        case .staging:
            Environment.current = Environment.staging
        case .production:
            Environment.current = Environment.production
        case .testing:
            Environment.current = Environment.testing
        }
    }
}
