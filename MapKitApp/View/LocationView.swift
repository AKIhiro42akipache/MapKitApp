//
//  LocationView.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D{
    static let parking = CLLocationCoordinate2D(latitude: 35.705131, longitude: 139.7352987)
}

struct LocationView: View {
    @EnvironmentObject private var viewModel:LocationViewModel
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center:.parking, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    let maxWidthForIpad:CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                //IPadモード対応
                    .frame(maxWidth: 700)
                Spacer()
                locationsPreviewStack
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss:  nil) { location in
            LocationDetailView(location: location)
        }
    }
}
#Preview {
    LocationView()
        .environmentObject(LocationViewModel())
}

extension LocationView{
    private var header: some View{
        VStack{
            Button(action:viewModel.toggleLocationList){
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(.black.opacity(0.7))
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                //Overlayは↑で作成したViewに別のViewを重ねる
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.black.opacity(0.7))
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? 180: 0))
                    }
            }
            
            if viewModel.showLocationList{
                LocationList()
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 20,
                x: 0,y: 15)
    }
    
    private var mapLayer: some View{
        //MapとAnnotitionとVStackの処理はスコープを別にする
        //Positionを$mapRegionからBindingしないと要素を押下しても
        Map(position: $viewModel.mapRegion) {
            // ピンの追加方法
            ForEach(viewModel.locations) { location in
                // アノテーションの表示にMapAnnotationを使用
                Annotation("location", coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 1)
                        .onTapGesture {
                            viewModel.showNextLocation(location: location)
                        }
                }
                // パンIconの下に表示されるタイトルを非表示に設定
                .annotationTitles(.hidden)
            }
        }
        //地図で表示されている領域を押下したときにシートが開かれていた場合は閉じる
        .onTapGesture {
            if viewModel.showLocationList{
                viewModel.toggleLocationList()
            }
        }
    }
    private var locationsPreviewStack: some View{
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                    //Ipadモードの対応
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .identity))
                }
            }
        }
    }
}
