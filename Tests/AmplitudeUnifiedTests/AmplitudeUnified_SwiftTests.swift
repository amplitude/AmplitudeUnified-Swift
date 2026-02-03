import XCTest
@testable import AmplitudeUnified

class AmplitudeUnifiedTests: XCTestCase {

    func testCompiles() {
        // For now, just make sure we build on each platform
        _ = Amplitude(apiKey: "")
    }
}
