//
//  Plane.swift
//  swift-vehicle-lab
//
//  Created by Enrique Torrendell on 9/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane : Vehicle {
    
    let maxAltitude : Double
    var altitude : Double = 0.00
    
    var inFlight : Bool {
        if speed > 0.00 && altitude > 0.00 {
            return true
        } else {
            return false
        }
    }
    
    init(name:String,weight:Double,maxSpeed:Double,maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func takeoff() {
        if inFlight == false {
            altitude = maxAltitude * 1/10
            speed = maxSpeed * 1/10
        }
        else {
            print("I'm flying boy!")
        }
    }
    
    func land() {
        altitude = 0.00
        speed = 0.00
    }
    
    func climb() {
        if inFlight == true {
            altitude += maxAltitude * 1/10
            super.decelerate()
            if altitude > maxAltitude {
                altitude = maxAltitude
            }
        }
        else {
            print("I'm too tired to flight!")
        }
    }
    
    func dive() {
        if altitude > 0 {
            altitude -= maxAltitude * 1/10
            super.accelerate()
            if altitude < 0.00 {
                altitude = 0.00
            }
        }
        else {
            print("I'm too tired to flight!")
        }
    }
    
    func bankRight() {
        if inFlight == true {
            heading += 45.00
            if heading > 360 {
                heading -= 360
            }
            speed = speed - speed * 0.1
        }
        else {
            print("I'm too tired to flight!")
        }
    }
    
    func bankLeft() {
        if inFlight == true {
            heading += 315.00
            if heading > 360 {
                heading -= 360
            }
            speed = speed - speed * 0.1
        }
        else {
            print("I'm too tired to flight!")
        }
    }
}
