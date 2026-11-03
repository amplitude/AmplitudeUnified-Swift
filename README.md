<p align="center">
  <a href="https://amplitude.com" target="_blank" align="center">
    <img src="https://static.amplitude.com/brand/amplitude-logo-with-text.svg" width="280">
  </a>
  <br />
</p>

# Unified SDK for Swift

A single interface for Amplitude Analytics, Experiment, and Session Replay (iOS only). For full documentation, see [Unified SDK for Swift](https://amplitude.com/docs/sdks/analytics/ios/unified-sdk).

## Setup

**Swift Package Manager:** In Xcode, **File** → **Swift Package Manager** → **Add Package Dependency**, then add:

```
https://github.com/amplitude/AmplitudeUnified-Swift
```

**CocoaPods:** Add to your `Podfile` and run `pod install`:

```ruby
pod 'AmplitudeUnified', '~> 0.0'
```

## Basic usage

```swift
let amplitude = Amplitude(apiKey: "YOUR_API_KEY")

amplitude.track(eventType: "Button Clicked", eventProperties: ["button_id": "sign_up"])

let identify = Identify()
identify.set(property: "plan", value: "premium")
amplitude.identify(identify: identify)

amplitude.setUserId(userId: "user@example.com")
```

For configuration, Experiment, Session Replay, identity management, and more, see the [Amplitude documentation](https://amplitude.com/docs/sdks/analytics/ios/unified-sdk).

## Custom HTTP clients and Analytics options

Pass a Core `HttpClient` to the Swift initializer to control Analytics uploads and shared Core remote-config and diagnostics requests. Replay uploads also use this client when the installed Replay SDK supports shared HTTP clients. Experiment fetches use their own transport.

```swift
let amplitude = Amplitude(
    apiKey: "YOUR_API_KEY",
    analyticsConfig: .init(
        optOut: false,
        enableDiagnostics: false,
        userId: "known-user-id",
        deviceId: "known-device-id"
    ),
    httpClient: routingClient // Your implementation of AmplitudeCore.HttpClient
)
```

`AnalyticsConfig` also exposes offline mode, log level, network tracking options, interaction options, and custom-endpoint request compression. Initial identity and opt-out are applied before Analytics starts. Existing initializers continue to use the default transport.

The Objective-C `AMPAnalyticsConfig` exposes opt-out, offline mode, interaction options, compression, and initial identity. Core's async Swift `HttpClient` is not exposed through the Objective-C configuration API.

## Support

- [Documentation](https://amplitude.com/docs/sdks/analytics/ios/unified-sdk) · [GitHub Issues](https://github.com/amplitude/AmplitudeUnified-Swift/issues) · [Contact Support](https://help.amplitude.com/hc/en-us/requests/new)
