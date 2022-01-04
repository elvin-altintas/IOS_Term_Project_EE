//
//  AnimationViewController.swift
//  TermProject-EE
//
//  Created by Elvin Altıntaş on 24.12.2021.
//

import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var animationView: UIImageView!
    @IBOutlet weak var potatoView: UIImageView!
    
    var selectedTip: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedTip)
        tipLabel.text = "This is how you " + selectedTip.uppercased() + "!"
        animationView.image = UIImage(named: selectedTip)
        potatoView.image = UIImage(named: "Potato")
        self.animationView.alpha = 1
        self.potatoView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //switch condition here
        switch selectedTip{
        case "Whisk":
            self.Whisk()
        case "Peel":
            self.potatoView.alpha = 1
            self.Peel()
        case "Boil":
            self.Boil()
        default:
            print("Nothing selected!")
        }
        
    }
    
    

    
   private func Whisk1(){
       self.animationView.transform = self.animationView.transform.rotated(by: 1)
    }

    private func Whisk2(){
        self.animationView.transform = self.animationView.transform.rotated(by: -1)
     }
    
    private func Whisk(){
        UIView.animate(withDuration: 0.5, delay: 0, options:[]){
            self.Whisk1() } completion: { animated in
                UIView.animate(withDuration: 0.5, delay: 0.05, options:[]){
                    self.Whisk2()} completion: { animated in
                        UIView.animate(withDuration: 0.5, delay: 0.05, options:[]){
                            self.Whisk1()} completion: { animated in
                                UIView.animate(withDuration: 0.5, delay: 0.05, options: []){
                                    self.Whisk2()}}}}}
    
    private func Peel1(){
        self.animationView.transform = self.animationView.transform.translatedBy(x: 0, y: 75)
    }
    private func Peel2(){
        self.animationView.transform = self.animationView.transform.translatedBy(x: 0, y: -75) 
    }
    
    private func Peel(){
        UIView.animate(withDuration: 1, delay: 0, options: []){
            self.Peel1() } completion: { animated in
                UIView.animate(withDuration: 1, delay: 0.05, options: []){
                    self.Peel2()} completion: { animated in
                        UIView.animate(withDuration: 1, delay: 0.05, options: []){
                            self.Peel1()} completion: { animated in
                                UIView.animate(withDuration: 1, delay: 0.05, options: []){
                                    self.Peel2()}}}}}
    
    
    
    
    private func Boil1(){
        self.animationView.transform = self.animationView.transform.rotated(by: 0.3)
    }
    private func Boil2(){
        self.animationView.transform = self.animationView.transform.rotated(by: -0.3)
    }

    private func Boil(){
        UIView.animate(withDuration: 0.5, delay: 0.05, options: []){
            self.Boil1() } completion: { animated in
                UIView.animate(withDuration: 0.5, delay: 0, options: []){
                    self.Boil2()}completion: { animated in
                        UIView.animate(withDuration: 0.5, delay: 0, options: []){
                            self.Boil1()}completion: { animated in
                                UIView.animate(withDuration: 0.5, delay: 0, options: []){
                                    self.Boil2()}completion: { animated in
                                        UIView.animate(withDuration: 0.5, delay: 0, options: []){
                                            self.Boil1()}completion: { animated in
                                                UIView.animate(withDuration: 0.5, delay: 0, options: []){
                                                    self.Boil2()}}}}}}}
    

    

}
