//
//  ViewController.swift
//  Conversores
//
//  Created by user156551 on 12/9/19.
//  Copyright © 2019 GABRIEL MELO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ShowNext(_ sender: Any) {
        switch lbUnit.text!{
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Grama", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("U$ Dolar", for: .normal)
                btUnit2.setTitle("R$ Real", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Kilometro", for: .normal)
                btUnit2.setTitle("Metros", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheit", for: .normal)
            
        }
        Convert(nil)
    }
    
    
    @IBAction func Convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        
        
        }
        
      
        
        func calcTemperature() {
            guard let temperature = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0 {
                lbResultUnit.text = "Farenheit"
                lbResult.text = String(temperature * 1.8 + 32.0)
            }else {
                lbResultUnit.text = "Celsius"
                lbResult.text = String(temperature - (32.0/1.8))
                
            }
                
            
        }
        
        func calcWeigth(){
            
             guard let weigth = Double(tfValue.text!) else {return}
                       if btUnit1.alpha == 1.0 {
                           lbResultUnit.text = "Kilos"
                           lbResult.text = String(weigth / 1000.0)
                       }else {
                               lbResultUnit.text = "gramas"
                               lbResult.text = String(weigth * 1000.0)
                           }
            }
            
        
        func calcCurrency(){
             guard let currency = Double(tfValue.text!) else {return}
                       if btUnit1.alpha == 1.0 {
                           lbResultUnit.text = "Dolar"
                        lbResult.text = String(currency / 4.2)
                       }else {
                               lbResultUnit.text = "Dolar"
                        lbResult.text = String(currency * 4.2)
                           }

    }
        func calcDistance(){
             guard let distance = Double(tfValue.text!) else {return}
                       if btUnit1.alpha == 1.0 {
                           lbResultUnit.text = "Kilometros"
                           lbResult.text = String(distance / 1000.0)
                       }else {
                               lbResultUnit.text = "Metros"
                               lbResult.text = String(distance * 1000.0)
                           }
        }
    
    
        
          switch lbUnit.text {
                  case "Temperatura":
                      calcTemperature()
                  case "Peso":
                      calcWeigth()
                  case "Moeda":
                      calcCurrency()
                  default:
                      calcDistance()

              }
        view.endEditing(true)
        let result =  Double(lbResult.text!)!
        lbResult.text = String(format: "%2.f", result)
}

}
