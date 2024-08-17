//
//  LocationList.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/04.
//

import SwiftUI

struct LocationList: View {
    @EnvironmentObject private var viewModel:LocationViewModel
    var body: some View {
        List{
            ForEach(viewModel.locations,id: \.id){location in
                Button{
                    viewModel.showNextLocation(location: location)
                }label:{
                    listRowView(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
            }
        }
        //Listの装飾形式を指定できる
        //https://capibara1969.com/2266/
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationList()
        .environmentObject(LocationViewModel())
}

extension LocationList{
    private func listRowView(location:Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:45,height:45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment:.leading){
                Text(location.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                Text(location.cityName)
                    .foregroundStyle(.black)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
    }
}
