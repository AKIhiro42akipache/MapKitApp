//
//  LocationView.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var viewModel:LocationViewModel
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.705131, longitude: 139.7352987), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    var body: some View {
        ZStack{
            Map(position: $viewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing:0){
                header
                    .padding()
                Spacer()
                ZStack{
                    ForEach(viewModel.locations){location in
                        if viewModel.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3),radius: 20)
                                .padding()
                        }
                    }
                }
            }
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
}
