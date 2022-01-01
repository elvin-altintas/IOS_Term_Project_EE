//
//  FilterViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(systemName: "checkmark.square")! as UIImage
    
    let uncheckedImage = UIImage(systemName: "square")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}

class FilterViewController: UIViewController {
    //Calory Text Boxes for lower and upper limit
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    //number of ingredient Text Field
    @IBOutlet weak var ingredientNoTextField: UITextField!
    
    // diet check boxes
    
    @IBOutlet weak var vegetarianBox: CheckBox!
    @IBOutlet weak var veganBox: CheckBox!
    @IBOutlet weak var lowcarbBox: CheckBox!
    @IBOutlet weak var paleoBox: CheckBox!
   
    @IBOutlet weak var lowSugarBox: CheckBox!
    @IBOutlet weak var alcoholFreeBox: CheckBox!
    
    //allergies check boxes
    @IBOutlet weak var glutenBox: CheckBox!
    @IBOutlet weak var eggsBox: CheckBox!
    @IBOutlet weak var wheatBox: CheckBox!
    @IBOutlet weak var soyBox: CheckBox!
    @IBOutlet weak var fishBox: CheckBox!
    @IBOutlet weak var peanutsBox: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Filter Dish"
        // Do any additional setup after loading the view.
    }
    
   
    //add type check for empty and non-int cases
    func getIngredientNumber() -> Int? {
        let text  = ingredientNoTextField.text
        return Int(text ?? "")
    }
    
    func getCaloriesFrom() -> Int? {
        let text  = fromTextField.text
        return Int(text ?? "")
    }
    func getCaloriesTo() -> Int? {
        let text  = toTextField.text
        return Int(text ?? "")
    }
    
    //could be smarter too repetitive
    func getHealthLabels() -> [String:Bool]? {
        var healthLabels : [String: Bool] = [:]
        healthLabels["Fish-Free"] = fishBox.isChecked
        healthLabels["Egg-Free"] = eggsBox.isChecked
        healthLabels["Peanut-Free"] = peanutsBox.isChecked
        healthLabels["Soy-Free"] = soyBox.isChecked
        healthLabels["Gluten-Free"] = glutenBox.isChecked
        healthLabels["Wheat-Free"] = wheatBox.isChecked
        healthLabels["Alcohol-Free"] = alcoholFreeBox.isChecked
        healthLabels["Vegan"] = veganBox.isChecked
        healthLabels["Vegetarian"] = vegetarianBox.isChecked
        healthLabels["Paleo"] = paleoBox.isChecked
        healthLabels["Low-Sugar"] = lowSugarBox.isChecked

        return healthLabels
    }
    func getDietLabels() -> [String:Bool]? {
        var dietLabels : [String: Bool] = [:]
        dietLabels["Low-Carb"] = lowcarbBox.isChecked
        return dietLabels
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let dishListViewController = segue.destination as! DishListViewController
        dishListViewController.healthLabels = self.getHealthLabels()
        dishListViewController.dietLabels = self.getDietLabels()
        dishListViewController.ingredientNumber = self.getIngredientNumber()
        dishListViewController.fromCalories = self.getCaloriesFrom()
        dishListViewController.toCalories = self.getCaloriesTo()
   //  pharmaciesViewController.selectedRegionId = region.Id
    }
    

}
