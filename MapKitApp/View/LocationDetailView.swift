//
//  LocationDetailView.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/14.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var viewModel:LocationViewModel
    @State var position:MapCameraPosition
    let location:Location
    
    init(location: Location) {
        self.location = location
        position = MapCameraPosition.region(
            MKCoordinateRegion(center:location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        ScrollView{
            VStack{
                imageHeader
                    .shadow(color: .black.opacity(0.3), radius: 20,x:0,y: 10)
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(
            backButton, alignment: .topLeading
        )
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}

extension LocationDetailView{
    private var imageHeader: some View{
        TabView{
            ForEach(location.imageNames, id: \.self){ imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: DisplayInfo.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection : some View{
        VStack(alignment: .leading , spacing :8){
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            if let url = URL(string: location.link){
                Link("Read more on ShapPage", destination:url)
                    .font(.headline)
                    .foregroundStyle(Color.blue.opacity(0.8))
            }
            
        }
    }
    
    private var mapLayer: some View{
        return Map(position: $position){
            /*TODO 細かい箇所だが、ピンとテキスト名が離れているため
             調整する(近づける)*/
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        //場所の中心に配置するがこの地図はユーザーが操作できないようにする(タップ・ドラックetc)
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black.opacity(0.1))
        )
    }
    
    private var backButton: some View{
        Button{
            viewModel.sheetLocation = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.black.opacity(0.6))
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        }
    }
}

