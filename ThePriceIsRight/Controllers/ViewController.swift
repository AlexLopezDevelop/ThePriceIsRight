//
//  RootViewController.swift
//  ThePriceIsRight
//
//  Created by Alex Lopez on 14/12/2018.
//  Copyright © 2018 Alex Lopez. All rights reserved.
//

import UIKit

//    let model = HousePricesModel()

class ViewController: UIViewController {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelSquareMeter: UILabel!
    
    
    override func viewDidLoad() {
        updatePredictions()
    }
    
    @IBAction func dataSelected(_ sender: Any) {
        guard let sender = sender as? UIView else {
            return
        }
        
        switch sender.tag {
            case 1:
                let sender = sender as! UISegmentedControl
                house.rooms = sender.selectedSegmentIndex + 1
                break
            case 2:
                let sender = sender as! UISegmentedControl
                house.bathrooms = sender.selectedSegmentIndex + 1
                break
            case 3:
                let sender = sender as! UISegmentedControl
                house.garage = sender.selectedSegmentIndex
                break
            case 4:
                let sender = sender as! UIStepper
                self.labelYear.text = "\(Int(sender.value))"
                house.year = Int(sender.value)
                break
            case 5:
                let sender = sender as! UISlider
                self.labelSquareMeter.text = "\(Int(sender.value)) m2"
                house.size = Int(sender.value)
                break
            case 6:
                let sender = sender as! UISegmentedControl
                house.condition = sender.selectedSegmentIndex
                break
            default:
                //Never
                break
        }
        self.updatePredictions()
    }
    
    // MARK: - Custom functions
    func updatePredictions() {
        do {
            //let prediction = try model.
        } catch {
            print(error.localizedDescription)
        }
        
        self.labelDescription.text = "\(house)"
    }
    
    func segmentedControlValue(_ sender: UIView) {
        let sender = sender as! UISegmentedControl
        print(sender.selectedSegmentIndex)
        house.rooms = sender.selectedSegmentIndex + 1
    }
}

