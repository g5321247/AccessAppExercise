//
//  RequestSetting.swift
//  AccessAppExercise
//
//  Created by George Liu on 2020/6/1.
//  Copyright © 2020 George Liu. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"

    var requestAdapter: AnyRequestAdapter {
        AnyRequestAdapter {
            var req = $0
            req.httpMethod = self.rawValue
            return req
        }
    }
}

protocol RequestAdapter {
    func adapted(request: URLRequest) throws -> URLRequest
}

struct AnyRequestAdapter: RequestAdapter {
    let block: (URLRequest) throws -> URLRequest

    func adapted(request: URLRequest) throws -> URLRequest {
        try block(request)
    }
}

struct RequestContentAdapter: RequestAdapter {
    let method: HTTPMethod
    let content: [String: Any]

    func adapted(request: URLRequest) throws -> URLRequest {
        switch method {
        case .get:
            return try URLQueryDataAdapter(parameters: content).adapted(request: request)
        }
    }
}

struct URLQueryDataAdapter: RequestAdapter {
    let parameters: [String: Any]

    func adapted(request: URLRequest) throws -> URLRequest {
        guard let url = request.url else {
            throw NetworkingError.RequestErrorReason.missingURL
        }

        var req = request
        let finalURL = encoded(url: url)
        req.url = finalURL

        return req
    }

    func encoded(url: URL) -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            parameters.isEmpty else { return url }
        components.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: $0.value as? String)
        }
        return components.url ?? url
    }
}
