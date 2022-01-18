//
//  DishDetailViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class DishDetailViewController: UIViewController{
   
    
    
   
    
    var selectedRecipe : Recipe?
    var recipeDatasource = RecipeDataSource()
    
    //@IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishDetailImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeButton: UIButton!
    
    @IBAction func openRecipeLink(_ sender: UIButton) {
        if let recipe = selectedRecipe{
            if let url = URL(string: recipe.url) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
            
        }
    
    
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recipeDatasource.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recipe = selectedRecipe{
            self.dishDetailImage.downloaded(from: recipe.image)
            self.title =  recipe.label
            self.ingredientsLabel.text = recipe.dietLabels.joined(separator: " ")
            let buttonText = "Detailed recipe can be found in: "
            let websiteLink = String(recipe.url.split(separator: ".")[1])
            self.recipeButton.setTitle((buttonText + websiteLink), for: .normal)
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

extension DishDetailViewController: RecipeDataSourceDelegate{
    func recipeListLoaded() {
    }

    func suggestedRecipeLoaded(recipe: Recipe) {
    }
}

