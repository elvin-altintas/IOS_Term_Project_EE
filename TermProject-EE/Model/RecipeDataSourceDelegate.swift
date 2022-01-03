//
//  File.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 27.12.2021.
//

import Foundation
import UIKit

protocol RecipeDataSourceDelegate {
    func recipeListLoaded()
    func suggestedRecipeLoaded(recipe: Recipe)
}
