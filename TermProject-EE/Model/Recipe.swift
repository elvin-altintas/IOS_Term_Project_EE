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
    let url: String //recipe url
    
}

struct UpperRecipe:Codable{
    let recipe: Recipe
}

struct RecipeCountDict:Codable{
    let count: Int
    let recipeList: [UpperRecipe]
    
    enum CodingKeys: String,CodingKey{
        case count
        case recipeList = "hits"
    }
}
