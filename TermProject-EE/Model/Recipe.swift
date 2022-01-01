//
//  Recipe.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 27.12.2021.
//

import Foundation

struct Recipe: Codable{
    let label: String
    let image: String
    let dietLabels: [String]
    let healthLabels: [String]
    
}

