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
    
    func getRealIndex(indexPath: IndexPath) -> Int {
        if (recipeDataSource.getNumberOfRecipes() == 0) {
            return 0;
        }
        let realIndex = indexPath.row.quotientAndRemainder(dividingBy: recipeDataSource.getNumberOfRecipes()).remainder
        return realIndex
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! DishTableViewCell
        if let indexPath = self.DishTableView.indexPath(for: cell){
            let recipe = recipeDataSource.getRecipeWithIndex(index: getRealIndex(indexPath: indexPath))
            let recipeDetailViewController = segue.destination as! DishDetailViewController
            recipeDetailViewController.selectedRecipe = recipe
        }
        
    }
    
  
}


extension DishListViewController: RecipeDataSourceDelegate {
    func recipeListLoaded() {
        self.DishTableView.reloadData()
    }
}

extension DishListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeDataSource.getNumberOfRecipes()
    }
    
    func suggestedRecipeLoaded(recipe: Recipe) {}
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell", for: indexPath) as! DishTableViewCell
        let recipe = recipeDataSource.getRecipeWithIndex(index: indexPath.row)
       
        cell.dishLabel.text = recipe.label
        cell.dishImage.downloaded(from: recipe.image)
        return cell
    }
    
}
