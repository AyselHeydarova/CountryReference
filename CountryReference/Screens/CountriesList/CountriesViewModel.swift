//
//  CountriesViewModel.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation
import Alamofire

class CountriesViewModel {
    var countries: [CountryModel] = []
    var region: RegionalBlocs

    private var networkService: NetworkServiceProtocol

    init (region: RegionalBlocs,networkService: NetworkServiceProtocol = NetworkService()) {
        self.region = region
        self.networkService = NetworkService()
    }

    func fetchCountries(onCompletion: @escaping () -> Void) {
        networkService.execute(CountriesEndpoints.getRegionCountries(region: region)) { (result: Result<[CountryModel], AFError>)in
            switch result {
            case .success(let data):
                self.countries = data
                onCompletion()
            case .failure(let failure):
                onCompletion()
                print("failure", failure)
            }
        }
    }
}
