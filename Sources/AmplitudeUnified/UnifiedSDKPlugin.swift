//
//  UnifiedSDKPlugin.swift
//  AmplitudeUnified
//
//  Created by Chris Leonavicius on 5/9/25.
//

import AmplitudeSwift

class UnifiedSDKPlugin: Plugin {

    static let prefix = "amplitude-swift-unified"

    let type: PluginType = .before
    let name = "com.amplitude.UnifiedSDKPlugin"

    func execute(event: BaseEvent) -> BaseEvent? {
        event.library = "\(Self.prefix)/\(Constants.unifiedSDKVersion)-\(event.library ?? "")"
        return event
    }
}
