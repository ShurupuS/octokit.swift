import Foundation
import RequestKit
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public extension Octokit {

    /**
        Fetches the followers of the authenticated user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter completion: Callback for the outcome of the fetch.
    */
    @discardableResult
    func myFollowers(_ session: RequestKitURLSession = URLSession.shared, completion: @escaping (_ response: Result<[User], Error>) -> Void) -> URLSessionDataTaskProtocol? {
        let router = FollowRouter.readAuthenticatedFollowers(configuration)
        return router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self) { users, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let users = users {
                    completion(.success(users))
                }
            }
        }
    }

    /**
        Fetches the followers of the authenticated user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func myFollowers(_ session: RequestKitURLSession = URLSession.shared) async throws -> [User] {
        let router = FollowRouter.readAuthenticatedFollowers(configuration)
        return try await router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self)
    }

    /**
        Fetches the followers of a user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter name: Name of the user
        - parameter completion: Callback for the outcome of the fetch.
    */
    @discardableResult
    func followers(_ session: RequestKitURLSession = URLSession.shared, name: String, completion: @escaping (_ response: Result<[User], Error>) -> Void) -> URLSessionDataTaskProtocol? {
        let router = FollowRouter.readFollowers(name, configuration)
        return router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self) { users, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let users = users {
                    completion(.success(users))
                }
            }
        }
    }

    /**
        Fetches the followers of a user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter name: Name of the user
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func followers(_ session: RequestKitURLSession = URLSession.shared, name: String) async throws -> [User] {
        let router = FollowRouter.readFollowers(name, configuration)
        return try await router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self)
    }

    /**
        Fetches the users following the authenticated user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter completion: Callback for the outcome of the fetch.
    */
    @discardableResult
    func myFollowing(_ session: RequestKitURLSession = URLSession.shared, completion: @escaping (_ response: Result<[User], Error>) -> Void) -> URLSessionDataTaskProtocol? {
        let router = FollowRouter.readAuthenticatedFollowing(configuration)
        return router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self) { users, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let users = users {
                    completion(.success(users))
                }
            }
        }
    }

    /**
        Fetches the users following the authenticated user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func myFollowing(_ session: RequestKitURLSession = URLSession.shared) async throws -> [User] {
        let router = FollowRouter.readAuthenticatedFollowing(configuration)
        return try await router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self)
    }

    /**
        Fetches the users following a user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter name: The name of the user
        - parameter completion: Callback for the outcome of the fetch.
    */
    @discardableResult
    func following(_ session: RequestKitURLSession = URLSession.shared, name: String, completion: @escaping (_ response: Result<[User], Error>) -> Void) -> URLSessionDataTaskProtocol? {
        let router = FollowRouter.readFollowing(name, configuration)
        return router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self) { users, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let users = users {
                    completion(.success(users))
                }
            }
        }
    }

    /**
        Fetches the users following a user
        - parameter session: RequestKitURLSession, defaults to URLSession.shared
        - parameter name: The name of the user
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func following(_ session: RequestKitURLSession = URLSession.shared, name: String) async throws -> [User] {
        let router = FollowRouter.readFollowing(name, configuration)
        return try await router.load(session, dateDecodingStrategy: .formatted(Time.rfc3339DateFormatter), expectedResultType: [User].self)
    }
}

enum FollowRouter: Router {
    case readAuthenticatedFollowers(Configuration)
    case readFollowers(String, Configuration)
    case readAuthenticatedFollowing(Configuration)
    case readFollowing(String, Configuration)

    var method: HTTPMethod {
        return .GET
    }

    var encoding: HTTPEncoding {
        return .url
    }

    var configuration: Configuration {
        switch self {
        case .readAuthenticatedFollowers(let config): return config
        case .readFollowers(_, let config): return config
        case .readAuthenticatedFollowing(let config): return config
        case .readFollowing(_, let config): return config
        }
    }

    var path: String {
        switch self {
        case .readAuthenticatedFollowers:
            return "user/followers"
        case .readFollowers(let username, _):
            return "users/\(username)/followers"
        case .readAuthenticatedFollowing:
            return "user/following"
        case .readFollowing(let username, _):
            return "users/\(username)/following"
        }
    }

    var params: [String: Any] {
        return [:]
    }
}
