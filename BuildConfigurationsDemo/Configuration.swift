//
//  Configuration.swift
//  BuildConfigurationsDemo
//
//  Created by Nut Jiraporn on 29/8/2566 BE.
//

import Foundation

enum Configuration: String {

    // MARK: - Configurations

    case staging
    case production
    case release

    // MARK: - Current Configuration

    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }

        guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Configuration")
        }

        return configuration
    }()

    // MARK: - Base URL

    static var baseURL: URL {
        switch current {
        case .staging:
            return URL(string: "https://staging.cocoacasts.com")!
        case .production, .release:
            return URL(string: "https://cocoacasts.com")!
        }
    }

}
