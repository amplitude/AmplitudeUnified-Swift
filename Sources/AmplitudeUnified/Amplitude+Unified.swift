//
//  Amplitude+Unified.swift
//  Amplitude-Swift
//
//  Created by Chris Leonavicius on 1/29/25.
//

@_exported import AmplitudeCore
@_exported import AmplitudeSwift

#if canImport(AmplitudeExperiment)
@_exported import AmplitudeExperiment
#else
@_exported import Experiment
#endif

#if canImport(AmplitudeSessionReplay)
    @_exported import AmplitudeSessionReplay
#endif

public extension Amplitude {
    #if canImport(AmplitudeSessionReplay)
        convenience init(
            apiKey: String,
            serverZone: AmplitudeCore.ServerZone = .US,
            instanceName: String = Constants.Configuration.DEFAULT_INSTANCE,
            analyticsConfig: AnalyticsConfig = .init(),
            experimentConfig: ExperimentPlugin.Config = .init(),
            sessionReplayConfig: SessionReplayPlugin.Config = .init(),
            logger: any Logger = ConsoleLogger()
        ) {
            self.init(apiKey: apiKey,
                      serverZone: serverZone,
                      instanceName: instanceName,
                      analyticsConfig: analyticsConfig,
                      experimentConfig: experimentConfig,
                      sessionReplayConfig: sessionReplayConfig,
                      logger: logger,
                      httpClient: nil)
        }

        /// Uses the client for Analytics and shared Core requests, and Replay uploads with a compatible Replay SDK.
        /// Experiment fetches use their own transport and are not routed through this client.
        convenience init(
            apiKey: String,
            serverZone: AmplitudeCore.ServerZone = .US,
            instanceName: String = Constants.Configuration.DEFAULT_INSTANCE,
            analyticsConfig: AnalyticsConfig = .init(),
            experimentConfig: ExperimentPlugin.Config = .init(),
            sessionReplayConfig: SessionReplayPlugin.Config = .init(),
            logger: any Logger = ConsoleLogger(),
            httpClient: (any HttpClient)?
        ) {
            self.init(configuration: .init(apiKey: apiKey,
                                           serverZone: serverZone,
                                           instanceName: instanceName,
                                           analyticsConfig: analyticsConfig,
                                           logger: logger,
                                           httpClient: httpClient))
            add(plugin: SessionReplayPlugin(config: sessionReplayConfig))
            add(plugin: ExperimentPlugin(config: experimentConfig))
            add(plugin: UnifiedSDKPlugin())
        }
    #else
        convenience init(
            apiKey: String,
            serverZone: AmplitudeCore.ServerZone = .US,
            instanceName: String = Constants.Configuration.DEFAULT_INSTANCE,
            analyticsConfig: AnalyticsConfig = .init(),
            experimentConfig: ExperimentPlugin.Config = .init(),
            logger: any Logger = ConsoleLogger()
        ) {
            self.init(apiKey: apiKey,
                      serverZone: serverZone,
                      instanceName: instanceName,
                      analyticsConfig: analyticsConfig,
                      experimentConfig: experimentConfig,
                      logger: logger,
                      httpClient: nil)
        }

        /// Uses the client for Analytics and shared Core requests, and Replay uploads with a compatible Replay SDK.
        /// Experiment fetches use their own transport and are not routed through this client.
        convenience init(
            apiKey: String,
            serverZone: AmplitudeCore.ServerZone = .US,
            instanceName: String = Constants.Configuration.DEFAULT_INSTANCE,
            analyticsConfig: AnalyticsConfig = .init(),
            experimentConfig: ExperimentPlugin.Config = .init(),
            logger: any Logger = ConsoleLogger(),
            httpClient: (any HttpClient)?
        ) {
            self.init(configuration: .init(apiKey: apiKey,
                                           serverZone: serverZone,
                                           instanceName: instanceName,
                                           analyticsConfig: analyticsConfig,
                                           logger: logger,
                                           httpClient: httpClient))
            add(plugin: ExperimentPlugin(config: experimentConfig))
            add(plugin: UnifiedSDKPlugin())
        }
    #endif
}
