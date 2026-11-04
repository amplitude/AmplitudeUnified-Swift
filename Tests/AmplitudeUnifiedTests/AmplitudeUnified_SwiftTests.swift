import XCTest
@testable import AmplitudeUnified

class AmplitudeUnifiedTests: XCTestCase {

    func testCompiles() {
        // For now, just make sure we build on each platform
        _ = Amplitude(apiKey: "")
    }

    func testCustomHttpClientReceivesAnalyticsUpload() {
        let uploaded = expectation(description: "Analytics upload uses custom client")
        let client = UploadHttpClient(uploaded: uploaded)
        let amplitude = Amplitude(apiKey: "test-key", instanceName: UUID().uuidString,
                                  analyticsConfig: .init(serverURL: "https://analytics.example.invalid/upload",
                                                         autocapture: [],
                                                         enableAutoCaptureRemoteConfig: false),
                                  experimentConfig: .init(fetchOnStart: false, pollOnStart: false,
                                                          automaticFetchOnAmplitudeIdentityChange: false),
                                  httpClient: client)
        XCTAssertTrue(amplitude.configuration.httpClient as AnyObject === client)
        amplitude.track(eventType: "test")
        amplitude.flush()
        wait(for: [uploaded], timeout: 5)
    }

    func testLegacyInitializerUsesDefaultHttpClient() {
        let amplitude = Amplitude(apiKey: "", instanceName: UUID().uuidString,
                                  analyticsConfig: .init(autocapture: [], enableAutoCaptureRemoteConfig: false),
                                  experimentConfig: .init(fetchOnStart: false, pollOnStart: false,
                                                          automaticFetchOnAmplitudeIdentityChange: false))
        XCTAssertNil(amplitude.configuration.httpClient)
    }

    func testAnalyticsOptionsAreForwardedBeforeInitialization() {
        let interactions = InteractionsOptions(rageClick: .init(enabled: false), deadClick: .init(enabled: false))
        let network = NetworkTrackingOptions(captureRules: [], ignoreHosts: ["ignored.example"], ignoreAmplitudeRequests: false)
        let config = AnalyticsConfig(autocapture: [], migrateLegacyData: false,
                                     enableAutoCaptureRemoteConfig: false, optOut: true,
                                     offline: true, networkTrackingOptions: network, interactionsOptions: interactions,
                                     enableDiagnostics: false, enableRequestBodyCompression: true,
                                     userId: "initial-user", deviceId: "initial-device")
        let configuration = Configuration(apiKey: "test-key", serverZone: .EU, instanceName: UUID().uuidString,
                                          analyticsConfig: config, logger: ConsoleLogger())
        XCTAssertTrue(configuration.optOut)
        XCTAssertEqual(configuration.offline, true)
        XCTAssertTrue(configuration.interactionsOptions === interactions)
        XCTAssertEqual(configuration.networkTrackingOptions.ignoreHosts, ["ignored.example"])
        XCTAssertFalse(configuration.networkTrackingOptions.ignoreAmplitudeRequests)
        XCTAssertTrue(configuration.networkTrackingOptions.captureRules.isEmpty)
        XCTAssertFalse(configuration.enableDiagnostics)
        XCTAssertTrue(configuration.enableRequestBodyCompression)
        XCTAssertEqual(configuration.userId, "initial-user")
        XCTAssertEqual(configuration.deviceId, "initial-device")
        XCTAssertFalse(configuration.migrateLegacyData)
    }

    func testObjCAnalyticsOptionsAreForwarded() {
        let config = ObjCAnalyticsConfig()
        config.optOut = true
        config.offline = true
        config.enableRequestBodyCompression = true
        config.userId = "initial-user"
        config.deviceId = "initial-device"
        config.migrateLegacyData = false
        let configuration = ObjCConfiguration(apiKey: "test-key", serverZone: .EU, instanceName: UUID().uuidString,
                                              analyticsConfig: config, logger: nil)
        XCTAssertTrue(configuration.optOut)
        XCTAssertEqual(configuration.offline, true)
        XCTAssertTrue(configuration.enableRequestBodyCompression)
        XCTAssertEqual(configuration.userId, "initial-user")
        XCTAssertEqual(configuration.deviceId, "initial-device")
        XCTAssertFalse(configuration.migrateLegacyData)
    }

}

private final class UploadHttpClient: HttpClient {
    let uploaded: XCTestExpectation

    init(uploaded: XCTestExpectation) {
        self.uploaded = uploaded
    }

    func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        await Task.yield()
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        if request.url?.host == "analytics.example.invalid" {
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertNotNil(request.httpBody)
            uploaded.fulfill()
            return (Data(#"{"code":200,"events_ingested":1}"#.utf8), response)
        }
        return (Data(#"{"configs":{}}"#.utf8), response)
    }
}
