//
//  House.swift
//  ThePriceIsRight
//
//  Created by Alex Lopez on 16/12/2018.
//  Copyright © 2018 Alex Lopez. All rights reserved.
//

import Foundation

let house = House()

class House: CustomStringConvertible {
    var rooms = 1
    var bathrooms = 1
    var garage = 0
    var year = 1975
    var size = 100
    var condition = 0
    
    var description: String {
        let bed = "🛏"
        var beds = ""
        let bath = "🚽"
        var baths = ""
        let car = "🚘"
        var cars = ""
        let star = "⭐️"
        var valoration = ""
        
        for _ in 1...rooms {
            beds = "\(beds)\(bed)"
        }
        
        for _ in 1...bathrooms {
            baths = "\(baths)\(bath)"
        }
        if garage > 0 {
            for _ in 1...garage {
                cars = "\(cars)\(car)"
            }
        }
        
        for _ in 0...condition {
            valoration = "\(valoration)\(star)"
        }
        
        return """
        Descripción de la casa
        
        - Habitaciones: \(beds)
        - Baños: \(baths)
        - Plazas de Garaje: \(cars)
        - Año de construcción: \(year)
        - Superficie: \(size) m2
        - Estado: \(valoration)
        """
    }
}
