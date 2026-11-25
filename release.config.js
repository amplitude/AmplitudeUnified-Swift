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
      "semantic-release-replace-plugin",
      {
        "replacements": [
          {
            "files": ["Sources/AmplitudeUnified/Constants.swift"],
            "from": "unifiedSDKVersion: String = \".*\"",
            "to": "unifiedSDKVersion: String = \"${nextRelease.version}\"",
            "results": [
              {
                "file": "Sources/AmplitudeUnified/Constants.swift",
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
      "assets": ["CHANGELOG.md", "Sources/AmplitudeUnified/Constants.swift"],
      "message": "chore(release): ${nextRelease.version} [skip ci]\n\n${nextRelease.notes}"
    }],
  ],
}
