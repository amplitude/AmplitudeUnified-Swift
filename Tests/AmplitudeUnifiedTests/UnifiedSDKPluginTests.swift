//
//  InjectUnifiedLibraryNamePlugin.swift
//  AmplitudeUnified
//
//  Created by Chris Leonavicius on 5/12/25.
//

@testable import AmplitudeSwift
@testable import AmplitudeUnified
import XCTest

class UnifiedSDKPluginTests: XCTestCase {

    func testInjectsLibraryName() throws {
        let amplitude = Amplitude(apiKey: "", instanceName: "testInjectsLibraryName",
                                  analyticsConfig: .init(autocapture: [],
                                                         enableAutoCaptureRemoteConfig: false),
                                  experimentConfig: .init(fetchOnStart: false, pollOnStart: false,
                                                          automaticFetchOnAmplitudeIdentityChange: false))
        let eventInterceptorPlugin = EventInterceptorPlugin()
        amplitude.add(plugin: eventInterceptorPlugin)
        let eventType = "Test"
        amplitude.track(eventType: eventType)

        // Initialization and event processing run asynchronously and can be slow on CI.
        wait(for: [eventInterceptorPlugin.didTrackEventExpectation], timeout: 5)

        XCTAssertEqual(eventInterceptorPlugin.events.count, 1)

        let event = try XCTUnwrap(eventInterceptorPlugin.events.first)
        XCTAssertEqual(event.eventType, eventType)
        XCTAssertEqual(event.library, "amplitude-swift-unified/\(Constants.unifiedSDKVersion)-\(Constants.SDK_LIBRARY)/\(Constants.SDK_VERSION)")
    }
}

private class EventInterceptorPlugin: Plugin {

    let didTrackEventExpectation: XCTestExpectation = {
        let expectation = XCTestExpectation(description: "EventInterceptorPlugin did track event")
        expectation.assertForOverFulfill = false
        return expectation
    }()
    let type: PluginType = .destination
    var events: [BaseEvent] = []

    func execute(event: BaseEvent) -> BaseEvent? {
        events.append(event)
        didTrackEventExpectation.fulfill()
        return nil
    }
}
