//
//  NetworkAlamofire.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation
import Alamofire

public protocol NetworkServiceProtocol: AnyObject {
    func execute<T: Codable>(_ endpoint: EndPointType, completion: @escaping (Swift.Result<T, AFError>) -> Void)
}

public class NetworkService: NetworkServiceProtocol {
    public func execute<T: Codable>(_ endpoint: EndPointType, completion: @escaping (Swift.Result<T, AFError>) -> Void) {
        let request = AF.request(endpoint.urlRequest)

        request.responseDecodable(of: T.self) { result in
            if let value = result.value {
                completion(.success(value))
            } else if let error = result.error {
                completion(.failure(error))
            }
        }
    }
}

