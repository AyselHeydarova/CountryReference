//
//  EndPointType.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation
import Alamofire


public protocol EndPointType: URLRequestConvertible {
    var baseURL: URL { get }
    var requestURL: URL { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
    var headers: HTTPHeaders { get }
}

extension EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://restcountries.com")
        else { fatalError("baseURL could not be configured.") }
        return url
    }

    var requestURL: URL {
        return baseURL.appendingPathComponent(path, isDirectory: false)
    }

    var encoding: ParameterEncoding {
        switch method {
        case .get :
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    var headers: HTTPHeaders {
        return HTTPHeaders()
    }

    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.name)
        }
        return request
    }

    public func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
