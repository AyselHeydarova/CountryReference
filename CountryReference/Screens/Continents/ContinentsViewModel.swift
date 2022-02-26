//
//  ContinentsViewModel.swift
//  CountryReference
//
//  Created by Aysel Heydarova on 25.02.22.
//

import Foundation

enum RegionalBlocs: String, CaseIterable {
       case EU
       case EFTA
       case CARICOM
       case PA
       case AU
       case USAN
       case EEU
       case AL
       case ASEAN
       case CAIS
       case CEFTA
       case NAFTA
       case SAARC
   }

class ContinentsViewModel {
    var allRegionalBlocs = RegionalBlocs.allCases
}
