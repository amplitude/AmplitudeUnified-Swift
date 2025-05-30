//
//  ObjCAmplitude+Unified.swift
//  AmplitudeUnified
//
//  Created by Chris Leonavicius on 5/23/25.
//

import Foundation

#if canImport(AmplitudeExperiment)
@_exported import AmplitudeExperiment
#else
@_exported import Experiment
#endif

#if canImport(AmplitudeSessionReplay)
import AmplitudeSessionReplay
#endif

public extension ObjCAmplitude {

    @objc convenience init(apiKey: String) {
        self.init(apiKey: apiKey, logger: nil)
    }

    @objc convenience init(apiKey: String, serverZone: AmplitudeCore.ServerZone) {
        self.init(apiKey: apiKey, serverZone: Configuration.Defaults.serverZone, logger: nil)
    }

#if canImport(AmplitudeSessionReplay)
    @objc convenience init(
        apiKey: String,
        serverZone: AmplitudeCore.ServerZone = Configuration.Defaults.serverZone,
        instanceName: String = Configuration.Defaults.instanceName,
        analyticsConfig: ObjCAnalyticsConfig = .init(),
        experimentConfig: ExperimentPlugin.Config = .init(),
        sessionReplayConfig: SessionReplayPlugin.Config = .init(),
        logger: ObjCLoggerProvider? = nil
    ) {
        self.init(configuration: ObjCConfiguration(apiKey: apiKey,
                                                   serverZone: serverZone,
                                                   instanceName: instanceName,
                                                   analyticsConfig: analyticsConfig,
                                                   logger: logger))
        add(plugin: SessionReplayPlugin(config: sessionReplayConfig))
        add(plugin: ExperimentPlugin(config: experimentConfig))
        add(plugin: UnifiedSDKPlugin())
    }
#else
    @objc convenience init(
        apiKey: String,
        serverZone: AmplitudeCore.ServerZone = Configuration.Defaults.serverZone,
        instanceName: String = Configuration.Defaults.instanceName,
        analyticsConfig: ObjCAnalyticsConfig = .init(),
        experimentConfig: ExperimentPlugin.Config = .init(),
        logger: ObjCLoggerProvider? = nil
    ) {
        self.init(configuration: ObjCConfiguration(apiKey: apiKey,
                                                   serverZone: serverZone,
                                                   instanceName: instanceName,
                                                   analyticsConfig: analyticsConfig,
                                                   logger: logger))
        add(plugin: ExperimentPlugin(config: experimentConfig))
        add(plugin: UnifiedSDKPlugin())
    }
#endif

    @objc var experiment: ExperimentClient? {
        return (self as? PluginHost)?.experiment
    }

#if canImport(AmplitudeSessionReplay)
    @objc var sessionReplay: SessionReplay? {
        return (self as? PluginHost)?.sessionReplay
    }
#endif
}
