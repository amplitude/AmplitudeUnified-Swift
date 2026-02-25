<p align="center">
  <a href="https://amplitude.com" target="_blank" align="center">
    <img src="https://static.amplitude.com/lightning/46c85bfd91905de8047f1ee65c7c93d6fa9ee6ea/static/media/amplitude-logo-with-text.4fb9e463.svg" width="280">
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

## Support

- [Documentation](https://amplitude.com/docs/sdks/analytics/ios/unified-sdk) · [GitHub Issues](https://github.com/amplitude/AmplitudeUnified-Swift/issues) · [Contact Support](https://help.amplitude.com/hc/en-us/requests/new)
