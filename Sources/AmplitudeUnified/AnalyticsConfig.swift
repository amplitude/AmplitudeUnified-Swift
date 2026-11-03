//
//  AnalyticsConfig.swift
//  AmplitudeUnified-Swift
//
//  Created by Chris Leonavicius on 4/16/25.
//

import AmplitudeSwift

// MARK: - AnalyticsConfig

public struct AnalyticsConfig {
    // MARK: Lifecycle

    @_disfavoredOverload
    public init(
        flushQueueSize: Int = Configuration.Defaults.flushQueueSize,
        flushIntervalMillis: Int = Configuration.Defaults.flushIntervalMillis,
        storageProvider: (any Storage)? = nil,
        identifyStorageProvider: (any Storage)? = nil,
        minIDLength: Int? = nil,
        partnerID: String? = nil,
        callback: EventCallback? = nil,
        flushMaxRetries: Int = Configuration.Defaults.flushMaxRetries,
        useBatch: Bool = Configuration.Defaults.useBatch,
        serverURL: String? = nil,
        plan: Plan? = nil,
        ingestionMetadata: IngestionMetadata? = nil,
        trackingOptions: TrackingOptions = Configuration.Defaults.trackingOptions,
        enableCoppaControl: Bool = Configuration.Defaults.enableCoppaControl,
        flushEventsOnClose: Bool = Configuration.Defaults.flushEventsOnClose,
        minTimeBetweenSessionsMillis: Int = Configuration.Defaults.minTimeBetweenSessionsMillis,
        autocapture: AutocaptureOptions = Configuration.Defaults.autocaptureOptions,
        identifyBatchIntervalMillis: Int = Configuration.Defaults.identifyBatchIntervalMillis,
        maxQueuedEventCount: Int = Configuration.Defaults.maxQueuedEventCount,
        migrateLegacyData: Bool = Configuration.Defaults.migrateLegacyData,
        enableAutoCaptureRemoteConfig: Bool = Configuration.Defaults.enableAutoCaptureRemoteConfig
    ) {
        self.init(flushQueueSize: flushQueueSize,
                  flushIntervalMillis: flushIntervalMillis,
                  storageProvider: storageProvider,
                  identifyStorageProvider: identifyStorageProvider,
                  minIDLength: minIDLength,
                  partnerID: partnerID,
                  callback: callback,
                  flushMaxRetries: flushMaxRetries,
                  useBatch: useBatch,
                  serverURL: serverURL,
                  plan: plan,
                  ingestionMetadata: ingestionMetadata,
                  trackingOptions: trackingOptions,
                  enableCoppaControl: enableCoppaControl,
                  flushEventsOnClose: flushEventsOnClose,
                  minTimeBetweenSessionsMillis: minTimeBetweenSessionsMillis,
                  autocapture: autocapture,
                  identifyBatchIntervalMillis: identifyBatchIntervalMillis,
                  maxQueuedEventCount: maxQueuedEventCount,
                  migrateLegacyData: migrateLegacyData,
                  enableAutoCaptureRemoteConfig: enableAutoCaptureRemoteConfig,
                  optOut: Configuration.Defaults.optOut)
    }

    public init(
        flushQueueSize: Int = Configuration.Defaults.flushQueueSize,
        flushIntervalMillis: Int = Configuration.Defaults.flushIntervalMillis,
        storageProvider: (any Storage)? = nil,
        identifyStorageProvider: (any Storage)? = nil,
        minIDLength: Int? = nil,
        partnerID: String? = nil,
        callback: EventCallback? = nil,
        flushMaxRetries: Int = Configuration.Defaults.flushMaxRetries,
        useBatch: Bool = Configuration.Defaults.useBatch,
        serverURL: String? = nil,
        plan: Plan? = nil,
        ingestionMetadata: IngestionMetadata? = nil,
        trackingOptions: TrackingOptions = Configuration.Defaults.trackingOptions,
        enableCoppaControl: Bool = Configuration.Defaults.enableCoppaControl,
        flushEventsOnClose: Bool = Configuration.Defaults.flushEventsOnClose,
        minTimeBetweenSessionsMillis: Int = Configuration.Defaults.minTimeBetweenSessionsMillis,
        autocapture: AutocaptureOptions = Configuration.Defaults.autocaptureOptions,
        identifyBatchIntervalMillis: Int = Configuration.Defaults.identifyBatchIntervalMillis,
        maxQueuedEventCount: Int = Configuration.Defaults.maxQueuedEventCount,
        migrateLegacyData: Bool = Configuration.Defaults.migrateLegacyData,
        enableAutoCaptureRemoteConfig: Bool = Configuration.Defaults.enableAutoCaptureRemoteConfig,
        optOut: Bool = Configuration.Defaults.optOut,
        logLevel: LogLevelEnum = Configuration.Defaults.logLevel,
        offline: Bool? = false,
        networkTrackingOptions: NetworkTrackingOptions = Configuration.Defaults.networkTrackingOptions,
        interactionsOptions: InteractionsOptions = Configuration.Defaults.interactionsOptions,
        enableDiagnostics: Bool = Configuration.Defaults.enableDiagnostics,
        enableRequestBodyCompression: Bool = Configuration.Defaults.enableRequestBodyCompression,
        userId: String? = nil,
        deviceId: String? = nil
    ) {
        self.optOut = optOut
        self.logLevel = logLevel
        self.offline = offline
        self.networkTrackingOptions = networkTrackingOptions
        self.interactionsOptions = interactionsOptions
        self.enableDiagnostics = enableDiagnostics
        self.enableRequestBodyCompression = enableRequestBodyCompression
        self.userId = userId
        self.deviceId = deviceId
        self.flushQueueSize = flushQueueSize
        self.flushIntervalMillis = flushIntervalMillis
        self.storageProvider = storageProvider
        self.identifyStorageProvider = identifyStorageProvider
        self.minIDLength = minIDLength
        self.partnerID = partnerID
        self.callback = callback
        self.flushMaxRetries = flushMaxRetries
        self.useBatch = useBatch
        self.serverURL = serverURL
        self.plan = plan
        self.ingestionMetadata = ingestionMetadata
        self.trackingOptions = trackingOptions
        self.enableCoppaControl = enableCoppaControl
        self.flushEventsOnClose = flushEventsOnClose
        self.minTimeBetweenSessionsMillis = minTimeBetweenSessionsMillis
        self.autocapture = autocapture
        self.identifyBatchIntervalMillis = identifyBatchIntervalMillis
        self.maxQueuedEventCount = maxQueuedEventCount
        self.migrateLegacyData = migrateLegacyData
        self.enableAutoCaptureRemoteConfig = enableAutoCaptureRemoteConfig
    }

    // MARK: Public

    public let optOut: Bool
    public let logLevel: LogLevelEnum
    public let offline: Bool?
    public let networkTrackingOptions: NetworkTrackingOptions
    public let interactionsOptions: InteractionsOptions
    public let enableDiagnostics: Bool
    public let enableRequestBodyCompression: Bool
    public let userId: String?
    public let deviceId: String?

    public let flushQueueSize: Int
    public let flushIntervalMillis: Int
    public let storageProvider: (any Storage)?
    public let identifyStorageProvider: (any Storage)?
    public let minIDLength: Int?
    public let partnerID: String?
    public let callback: EventCallback?
    public let flushMaxRetries: Int
    public let useBatch: Bool
    public let serverURL: String?
    public let plan: Plan?
    public let ingestionMetadata: IngestionMetadata?
    public let trackingOptions: TrackingOptions
    public let enableCoppaControl: Bool
    public let flushEventsOnClose: Bool
    public let minTimeBetweenSessionsMillis: Int
    public let identifyBatchIntervalMillis: Int
    public let autocapture: AutocaptureOptions
    public let maxQueuedEventCount: Int
    public let migrateLegacyData: Bool
    public let enableAutoCaptureRemoteConfig: Bool
}

extension Configuration {
    convenience init(
        apiKey: String,
        serverZone: AmplitudeCore.ServerZone,
        instanceName: String,
        analyticsConfig: AnalyticsConfig,
        logger: any Logger,
        httpClient: (any HttpClient)? = nil
    ) {
        self.init(apiKey: apiKey,
                  flushQueueSize: analyticsConfig.flushQueueSize,
                  flushIntervalMillis: analyticsConfig.flushIntervalMillis,
                  instanceName: instanceName,
                  optOut: analyticsConfig.optOut,
                  storageProvider: analyticsConfig.storageProvider,
                  identifyStorageProvider: analyticsConfig.identifyStorageProvider,
                  logLevel: analyticsConfig.logLevel,
                  loggerProvider: logger,
                  minIdLength: analyticsConfig.minIDLength,
                  partnerId: analyticsConfig.partnerID,
                  callback: analyticsConfig.callback,
                  flushMaxRetries: analyticsConfig.flushMaxRetries,
                  useBatch: analyticsConfig.useBatch,
                  serverZone: serverZone,
                  serverUrl: analyticsConfig.serverURL,
                  plan: analyticsConfig.plan,
                  ingestionMetadata: analyticsConfig.ingestionMetadata,
                  trackingOptions: analyticsConfig.trackingOptions,
                  enableCoppaControl: analyticsConfig.enableCoppaControl,
                  flushEventsOnClose: analyticsConfig.flushEventsOnClose,
                  minTimeBetweenSessionsMillis: analyticsConfig.minTimeBetweenSessionsMillis,
                  autocapture: analyticsConfig.autocapture,
                  identifyBatchIntervalMillis: analyticsConfig.identifyBatchIntervalMillis,
                  maxQueuedEventCount: analyticsConfig.maxQueuedEventCount,
                  migrateLegacyData: analyticsConfig.migrateLegacyData,
                  offline: analyticsConfig.offline,
                  networkTrackingOptions: analyticsConfig.networkTrackingOptions,
                  enableAutoCaptureRemoteConfig: analyticsConfig.enableAutoCaptureRemoteConfig,
                  interactionsOptions: analyticsConfig.interactionsOptions,
                  enableDiagnostics: analyticsConfig.enableDiagnostics,
                  enableRequestBodyCompression: analyticsConfig.enableRequestBodyCompression,
                  userId: analyticsConfig.userId,
                  deviceId: analyticsConfig.deviceId,
                  httpClient: httpClient)
    }
}
