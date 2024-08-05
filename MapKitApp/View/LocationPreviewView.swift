//
//  LocatonPreviewView.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/05.
//

import SwiftUI

struct LocatonPreviewView: View {
    
    let location:Location
    
    var body: some View {
        HStack(alignment:.bottom){
            VStack(alignment: .leading, spacing:16){
                imageSection
                titleSection
            }
                
            VStack(spacing:8){
                LoarnMoreButton
                NextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct LocatonPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.yellow.opacity(0.4).ignoresSafeArea()
            /*現在はダミーデータを入れているアプリを作成する際にはFirebaseから取得したデータを入れる*/
            LocatonPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
    }
}

//Viewを生成する拡張関数
extension LocatonPreviewView{
    private var imageSection: some View{
        ZStack(){
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height:100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View{
        VStack(alignment:.leading,spacing: 4){
            Text(location.name)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var LoarnMoreButton: some View{
        Button {
            
        }label: {
            Text("さらに詳しく")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(width: 100,height: 25)
        }
        .buttonStyle(.borderedProminent)
    }
    private var NextButton: some View{
        Button{
            
        }label:{
            Text("次へ")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(width: 100,height: 25)
        }
        .buttonStyle(.bordered)
    }
}
