//
//  Amplitude+Unified.swift
//  Amplitude-Swift
//
//  Created by Chris Leonavicius on 1/29/25.
//

@_exported import AmplitudeCore
@_exported import AmplitudeSwift
@_exported import Experiment

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
            self.init(configuration: .init(apiKey: apiKey,
                                           serverZone: serverZone,
                                           instanceName: instanceName,
                                           analyticsConfig: analyticsConfig,
                                           logger: logger))
            add(plugin: SessionReplayPlugin(config: sessionReplayConfig))
            add(plugin: ExperimentPlugin(config: experimentConfig))
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
            self.init(configuration: .init(apiKey: apiKey,
                                           serverZone: serverZone,
                                           instanceName: instanceName,
                                           analyticsConfig: analyticsConfig,
                                           logger: logger))
            add(plugin: ExperimentPlugin(config: experimentConfig))
        }
    #endif
}
