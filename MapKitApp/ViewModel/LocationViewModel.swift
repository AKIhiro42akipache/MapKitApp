//
//  LocationViewModel.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import Foundation
import SwiftUI
import MapKit

@MainActor
class LocationViewModel:ObservableObject{
    
    //地図上の全てのポイント
    @Published var locations:[Location]
    //地図上の現在値
    @Published var mapLocation:Location{
        didSet{
            //mapLocationの位置が更新されたらupdateMapRegionで位置を更新
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion:MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)))
    
    
    //show list of location
    @Published var showLocationList:Bool = false
    //Spanは地図上にどれだけの範囲を表示するかを指定する
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        //ViewModelを初期化するときにDataServiceからデータを取得する
        let location = LocationsDataService.locations
        //取得したデータをLocationに格納する
        self.locations = location
        self.mapLocation = location.first!
        self.updateMapRegion(location: location.first!)
    }
    
    private func updateMapRegion(location:Location) {
        withAnimation(.easeInOut){
            mapRegion = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
   func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
}
