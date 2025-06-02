amplitude_unified_version = "0.0.2" # Version is managed automatically by semantic-release, please don't change it manually

Pod::Spec.new do |s|
  s.name                   = "AmplitudeUnified"
  s.version                = amplitude_unified_version
  s.summary                = "Amplitude Unified SDK"
  s.homepage               = "https://amplitude.com"
  s.license                = { :type => "MIT" }
  s.author                 = { "Amplitude" => "dev@amplitude.com" }
  s.source                 = { :git => "https://github.com/amplitude/AmplitudeUnified-Swift.git", :tag => "v#{s.version}" }

  s.source_files           = 'Sources/AmplitudeUnified/**/*.{h,swift}'
  s.resource_bundle        = { 'AmplitudeUnified': ['Sources/AmplitudeUnified/PrivacyInfo.xcprivacy'] }
  s.swift_version          = '5.9'

  s.ios.deployment_target  = '13.0'
  s.tvos.deployment_target = '13.0'
  s.osx.deployment_target  = '10.15'
  s.watchos.deployment_target  = '7.0'
  s.visionos.deployment_target = '1.0'
  
  s.dependency 'AmplitudeExperiment', '>= 1.18.1', '< 2.0.0'
  s.dependency 'AmplitudeSwift', '>= 1.13.4', '< 2.0.0'

  s.ios.dependency 'AmplitudeSessionReplay', '>= 0.4.3', '< 2.0.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
