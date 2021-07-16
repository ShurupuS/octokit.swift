import XCTest
import OctoKit

class FollowTests: XCTestCase {
    func testGetMyFollowers() {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/followers", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: "users", statusCode: 200)
        let task = Octokit(config).myFollowers(session) { response in
            switch response {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
            case .failure:
                XCTFail("should not get an error")
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testGetMyFollowersAsync() async throws {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/followers", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: "users", statusCode: 200)
        let users = try await Octokit(config).myFollowers(session)
        XCTAssertEqual(users.count, 1)
        XCTAssertTrue(session.wasCalled)
    }

    func testFailToGetMyFollowers() {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/followers", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: nil, statusCode: 404)
        let task = Octokit(config).myFollowers(session) { response in
            switch response {
            case .success:
                XCTFail("should not retrieve followers")
            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 404)
                XCTAssertEqual(error.domain, OctoKitErrorDomain)
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testFailToGetMyFollowersAsync() async throws {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/followers", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: nil, statusCode: 404)
        do {
            let _ = try await Octokit(config).myFollowers(session)
            XCTFail("should not retrieve followers")
        } catch let error as NSError {
            XCTAssertEqual(error.code, 404)
            XCTAssertEqual(error.domain, OctoKitErrorDomain)
        }
        XCTAssertTrue(session.wasCalled)
    }

    func testGetUsersFollowers() {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/followers", expectedHTTPMethod: "GET", jsonFile: "users", statusCode: 200)
        let task = Octokit().followers(session, name: "octocat") { response in
            switch response {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
            case .failure:
                XCTFail("should not get an error")
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testGetUsersFollowersAsync() async throws {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/followers", expectedHTTPMethod: "GET", jsonFile: "users", statusCode: 200)
        let users = try await Octokit().followers(session, name: "octocat")
        XCTAssertEqual(users.count, 1)
        XCTAssertTrue(session.wasCalled)
    }

    func testFailToGetUsersFollowers() {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/followers", expectedHTTPMethod: "GET", jsonFile: nil, statusCode: 404)
        let task = Octokit().followers(session, name: "octocat") { response in
            switch response {
            case .success:
                XCTFail("should not retrieve followers")
            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 404)
                XCTAssertEqual(error.domain, OctoKitErrorDomain)
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testFailToGetUsersFollowersAsync() async throws {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/followers", expectedHTTPMethod: "GET", jsonFile: nil, statusCode: 404)
        do {
            let _ = try await Octokit().followers(session, name: "octocat")
            XCTFail("should not retrieve followers")
        } catch let error as NSError {
            XCTAssertEqual(error.code, 404)
            XCTAssertEqual(error.domain, OctoKitErrorDomain)
        }
        XCTAssertTrue(session.wasCalled)
    }

    func testGetMyFollowing() {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/following", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: "users", statusCode: 200)
        let task = Octokit(config).myFollowing(session) { response in
            switch response {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
            case .failure:
                XCTFail("should not get an error")
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testGetMyFollowingAsync() async throws {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/following", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: "users", statusCode: 200)
        let users = try await Octokit(config).myFollowing(session)
        XCTAssertEqual(users.count, 1)
        XCTAssertTrue(session.wasCalled)
    }

    func testFailToGetMyFollowing() {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/following", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: nil, statusCode: 404)
        let task = Octokit(config).myFollowing(session) { response in
            switch response {
            case .success:
                XCTFail("should not retrieve following")
            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 404)
                XCTAssertEqual(error.domain, OctoKitErrorDomain)
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testFailToGetMyFollowingAsync() async throws {
        let config = TokenConfiguration("user:12345")
        let headers = Helper.makeAuthHeader(username: "user", password: "12345")
        
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/user/following", expectedHTTPMethod: "GET", expectedHTTPHeaders: headers, jsonFile: nil, statusCode: 404)
        do {
            let _ = try await Octokit(config).myFollowing(session)
            XCTFail("should not retrieve following")
        } catch let error as NSError {
            XCTAssertEqual(error.code, 404)
            XCTAssertEqual(error.domain, OctoKitErrorDomain)
        }
        XCTAssertTrue(session.wasCalled)
    }

    func testGetUsersFollowing() {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/following", expectedHTTPMethod: "GET", jsonFile: "users", statusCode: 200)
        let task = Octokit().following(session, name: "octocat") { response in
            switch response {
            case .success(let users):
                XCTAssertEqual(users.count, 1)
            case .failure:
                XCTFail("should not get an error")
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testGetUsersFollowingAsync() async throws {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/following", expectedHTTPMethod: "GET", jsonFile: "users", statusCode: 200)
        let users = try await Octokit().following(session, name: "octocat")
        XCTAssertEqual(users.count, 1)
        XCTAssertTrue(session.wasCalled)
    }

    func testFailToGetUsersFollowing() {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/following", expectedHTTPMethod: "GET", jsonFile: nil, statusCode: 404)
        let task = Octokit().following(session, name: "octocat") { response in
            switch response {
            case .success:
                XCTFail("should not retrieve following")
            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 404)
                XCTAssertEqual(error.domain, OctoKitErrorDomain)
            }
        }
        XCTAssertNotNil(task)
        XCTAssertTrue(session.wasCalled)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testFailToGetUsersFollowingAsync() async throws {
        let session = OctoKitURLTestSession(expectedURL: "https://api.github.com/users/octocat/following", expectedHTTPMethod: "GET", jsonFile: nil, statusCode: 404)
        do {
            let _ = try await Octokit().following(session, name: "octocat")
            XCTFail("should not retrieve following")
        } catch let error as NSError {
            XCTAssertEqual(error.code, 404)
            XCTAssertEqual(error.domain, OctoKitErrorDomain)
        }
        XCTAssertTrue(session.wasCalled)
    }
}
