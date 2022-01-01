//
//  DishListViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class DishListViewController: UIViewController {
    var healthLabels : [String:Bool]?
    var dietLabels : [String:Bool]?
    
    var ingredientNumber : Int?
    var fromCalories : Int?
    var toCalories : Int?
    
    
    var recipeDataSource = RecipeDataSource()
    
    
    @IBOutlet weak var DishTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dish List"
        // Do any additional setup after loading the view.
        recipeDataSource.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedHealthLabels = healthLabels,
           let selectedDietLabels = dietLabels,
           let selectedIngredientNumber = ingredientNumber,
           let selectedFromCalories = fromCalories,
           let selectedToCalories = toCalories{
            recipeDataSource.loadRecipeList(allergyDict: selectedHealthLabels, fromCalories: selectedFromCalories, toCalories: selectedToCalories, ingredientNumber: selectedIngredientNumber, dietDict: selectedDietLabels)
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DishListViewController: RecipeDataSourceDelegate {
    func recipeListLoaded() {
        <#code#>
    }
    
  
    
 
    
   
   
}
