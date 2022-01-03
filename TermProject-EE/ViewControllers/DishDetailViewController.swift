//
//  DishDetailViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishDetailImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBAction func openRecipeLink(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com") {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
