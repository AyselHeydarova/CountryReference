//
//  CountriesEndpoints.swift
//  NetworingWithAlamofire
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation
import Alamofire

enum CountriesEndpoints {
    case getRegionCountries(region: RegionalBlocs)
    case getCountryDetails(country: String)
    case searchByCountry(searchText: String)
}

extension CountriesEndpoints: EndPointType {
    var path: String {
        switch self {
        case .getRegionCountries(let region):
            return "v2/regionalbloc/\(region.rawValue)"
        case .getCountryDetails(let country):
            return "v2/alpha/\(country)"
        case .searchByCountry(let countryName):
            return "v2/name/\(countryName)"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getRegionCountries, .getCountryDetails, .searchByCountry:
            return nil
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getRegionCountries, .getCountryDetails, .searchByCountry:
            return .get
        }
    }
}
