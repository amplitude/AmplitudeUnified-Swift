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

    func testInjectsLibraryName() {
        let amplitude = Amplitude(apiKey: "",
                                  analyticsConfig: .init(autocapture: [],
                                                         enableAutoCaptureRemoteConfig: false))
        let eventInterceptorPlugin = EventInterceptorPlugin()
        amplitude.add(plugin: eventInterceptorPlugin)
        let eventType = "Test"
        amplitude.track(eventType: eventType)

        wait(for: [eventInterceptorPlugin.didTrackEventExpectation], timeout: 0.1)

        XCTAssertEqual(eventInterceptorPlugin.events.count, 1)

        let event = eventInterceptorPlugin.events[0]
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
