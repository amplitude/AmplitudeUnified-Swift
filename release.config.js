module.exports = {
  "branches": ["main"],
  "plugins": [
    ["@semantic-release/commit-analyzer", {
      "preset": "angular",
      "parserOpts": {
        "noteKeywords": ["BREAKING CHANGE", "BREAKING CHANGES", "BREAKING"]
      }
    }],
    ["@semantic-release/release-notes-generator", {
      "preset": "angular",
    }],
    ["@semantic-release/changelog", {
      "changelogFile": "CHANGELOG.md"
    }],
    [
      "@google/semantic-release-replace-plugin",
      {
        "replacements": [
          {
            "files": ["AmplitudeUnified.podspec"],
            "from": "amplitude_unified_version = \".*\"",
            "to": "amplitude_unified_version = \"${nextRelease.version}\"",
            "results": [
              {
                "file": "AmplitudeUnified.podspec",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          },
          {
            "files": ["sources/AmplitudeUnified/Constants.swift"],
            "from": "unifiedSDKVersion: String = \".*\"",
            "to": "unifiedSDKVersion: String = \"${nextRelease.version}\"",
            "results": [
              {
                "file": "sources/AmplitudeUnified/Constants.swift",
                "hasChanged": true,
                "numMatches": 1,
                "numReplacements": 1
              }
            ],
            "countMatches": true
          }
        ]
      }
    ],
    ["@semantic-release/git", {
      "assets": ["AmplitudeUnified.podspec", "CHANGELOG.md", "sources/AmplitudeUnified/Constants.swift"],
      "message": "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
    }],
      ["@semantic-release/exec", {
        "publishCmd": "pod trunk push AmplitudeUnified.podspec",
      }],
    ],
  }
