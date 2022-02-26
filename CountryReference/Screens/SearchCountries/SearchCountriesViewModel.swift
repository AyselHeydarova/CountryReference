//
//  SearchCountriesViewModel.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 26.02.22.
//

import Foundation
import Alamofire

class SearchCountriesViewModel {
    private var networkService: NetworkServiceProtocol
    var searchResults: [CountryModel] = []

    init (networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = NetworkService()
    }

    func searchForCountry(searchText: String,
                          onCompletion: @escaping () -> Void) {
        networkService.execute(CountriesEndpoints.searchByCountry(searchText: searchText)) { (result: Result<[CountryModel], AFError>)in
            switch result {
            case .success(let data):
                self.searchResults = data
                onCompletion()
            case .failure(let failure):
                print("failure", failure)
            }
        }
    }
}
