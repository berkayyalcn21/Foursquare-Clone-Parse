//
//  PlaceModel.swift
//  Foursquare Clone
//
//  Created by Berkay on 19.07.2022.
//

import Foundation
import UIKit


class PlaceModel {
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    
    private init() {}
    
}
