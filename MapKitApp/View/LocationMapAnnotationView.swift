//
//  LocationMapAnnotationView.swift
//  MapKitApp
//
//  Created by 富澤明大 on 2024/08/14.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color.orange
    
    var body: some View {
        VStack(spacing:0){
            Image("pan")
                .resizable()
                .scaledToFit()
                .frame(width:35,height:35)
                .padding(5)
                .font(.headline)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 45, height: 45)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                )
                .overlay(
                    Circle()
                        .stroke(Color.orange, lineWidth: 3)
                )
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.orange)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-1)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
