//
//  ObjCAnalyticsConfig.swift
//  AmplitudeUnified
//
//  Created by Chris Leonavicius on 5/23/25.
//

import Foundation

@objc(AMPAnalyticsConfig)
@objcMembers
public class ObjCAnalyticsConfig: NSObject {

    // MARK: Public

    public var flushQueueSize = Configuration.Defaults.flushQueueSize
    public var flushIntervalMillis = Configuration.Defaults.flushIntervalMillis
    public var logLevel = Configuration.Defaults.logLevel
    public var minIDLength = -1
    public var partnerID: String?
    public var callback: ObjCEventCallback?
    public var flushMaxRetries = Configuration.Defaults.flushMaxRetries
    public var useBatch = Configuration.Defaults.useBatch
    public var serverUrl: String?
    public var plan: ObjCPlan?
    public var ingestionMetadata: ObjCIngestionMetadata?
    public var trackingOptions = ObjCTrackingOptions()
    public var enableCoppaControl = Configuration.Defaults.enableCoppaControl
    public var flushEventsOnClose = Configuration.Defaults.flushEventsOnClose
    public var minTimeBetweenSessionsMillis = Configuration.Defaults.minTimeBetweenSessionsMillis
    public var identifyBatchIntervalMillis = Configuration.Defaults.identifyBatchIntervalMillis
    public var autocapture = ObjCAutocaptureOptions.default
    public var migrateLegacyData = Configuration.Defaults.enableAutoCaptureRemoteConfig
    public var enableAutoCaptureRemoteConfig = Configuration.Defaults.enableAutoCaptureRemoteConfig
    public var networkTrackingOptions = ObjCNetworkTrackingOptions.defaultOptions()
}

extension ObjCConfiguration {
    convenience init(
        apiKey: String,
        serverZone: AmplitudeCore.ServerZone,
        instanceName: String,
        analyticsConfig: ObjCAnalyticsConfig,
        logger: ObjCLoggerProvider?
    ) {
        self.init(apiKey: apiKey,
                  instanceName: instanceName,
                  enableAutoCaptureRemoteConfig: analyticsConfig.enableAutoCaptureRemoteConfig)
        flushQueueSize = analyticsConfig.flushQueueSize
        flushIntervalMillis = analyticsConfig.flushIntervalMillis
        if let logger {
            loggerProvider = logger
        }
        logLevel = analyticsConfig.logLevel
        minIdLength = analyticsConfig.minIDLength
        callback = analyticsConfig.callback
        partnerId = analyticsConfig.partnerID
        flushMaxRetries = analyticsConfig.flushMaxRetries
        useBatch = analyticsConfig.useBatch
        self.serverZone = serverZone
        serverUrl = analyticsConfig.serverUrl
        plan = analyticsConfig.plan
        ingestionMetadata = analyticsConfig.ingestionMetadata
        enableCoppaControl = analyticsConfig.enableCoppaControl
        trackingOptions = analyticsConfig.trackingOptions
        flushEventsOnClose = analyticsConfig.flushEventsOnClose
        minTimeBetweenSessionsMillis = analyticsConfig.minTimeBetweenSessionsMillis
        autocapture = analyticsConfig.autocapture
        identifyBatchIntervalMillis = analyticsConfig.identifyBatchIntervalMillis
        migrateLegacyData = analyticsConfig.migrateLegacyData
        networkTrackingOptions = analyticsConfig.networkTrackingOptions
    }
}
