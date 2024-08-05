//
//  Location.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import Foundation
import MapKit

struct Location:Identifiable,Equatable{
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        //2つの型のインスタンスが等しいかどうかを比較するためのプロパティ
        lhs.id == rhs.id
    }
    
    let name:String
    let cityName:String
    let coordinates:CLLocationCoordinate2D
    let description:String
    let imageNames:[String]
    let link:String
    
    
    //Indentifier
    var id:String{
        name + cityName
    }
}
