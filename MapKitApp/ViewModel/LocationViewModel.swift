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
    //show location detail View sheet
    @Published var sheetLocation: Location? = nil
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
    
    func nextButtonClicked(){
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            print("現在位置のインデックスが見つかりませんでした")
            return
        }
        
        //現在の値+1をした位置を次のロケーションとする
        let nextIndex = currentIndex + 1
        //indicesはそのコレクションの全ての有効なインデックス（0からlocations.count - 1まで）を表す
        //nextIndexがその有効範囲内に含まれているかどうかを確認する
        //この処理は、nextIndexがlocationsの有効なインデックス範囲に含まれていることを確認している
        guard locations.indices.contains(nextIndex) else{
            //最初の位置と同じ位置に持ってくる
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
