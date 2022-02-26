//
//  CountryDetails.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 26.02.22.
//

import Foundation
import Alamofire

class CountryDetails {
    private var networkService: NetworkServiceProtocol

    init (networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = NetworkService()
    }

    func fetchCountryDetails(country: String,
                             onSuccessCompletion: @escaping (CountryModel) -> Void) {
        networkService.execute(CountriesEndpoints.getCountryDetails(country: country)) { (result: Result<CountryModel, AFError>)in
            switch result {
            case .success(let data):
                onSuccessCompletion(data)
            case .failure(let failure):
                print("failure", failure)
            }
        }
    }
}
