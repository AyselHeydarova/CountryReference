//
//  HTTPHeaderFields.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation

//The header fields
enum HttpHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}
