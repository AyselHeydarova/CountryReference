//
//  CountriesModel.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 26.02.22.
//

import Foundation

// MARK: - CountryModel
struct CountryModel: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String?
    let altSpellings: [String]?
    let subregion: String
    let region: String
    let population: Int
    let latlng: [Double]?
    let demonym: String
    let area: Double?
    let timezones: [String]
    let nativeName, numericCode: String
    let flags: Flags
    let currencies: [Currency]?
    let languages: [Language]
    let translations: Translations
    let flag: String
    let regionalBlocs: [RegionalBloc]?
    let independent: Bool
    let gini: Double?
    let borders: [String]?
    let cioc: String?
}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String
}

// MARK: - Flags
struct Flags: Codable {
    let svg: String
    let png: String
}

// MARK: - Language
struct Language: Codable {
    let iso6391, iso6392, name, nativeName: String?

    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name, nativeName
    }
}

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym: String
    let name: String
    let otherAcronyms, otherNames: [String]?
}

// MARK: - Translations
struct Translations: Codable {
    let br, pt, nl, hr: String
    let fa, de, es, fr: String?
    let ja, it, hu: String
}
