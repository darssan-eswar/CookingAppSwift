//
//  HomeView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI

struct HomeView: View {
  let name:String = "Arshia"
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
            // TODO The text and cart needs to be moved higher
            HStack(alignment:.top){
                Image(systemName:"cart.fill")
                    .imageScale(.large)
                
                    .padding(.leading)
                Spacer()
                Text("Welcome " + name)
                    .padding(.trailing)

            }
            
            .frame(alignment: .top)
            ScrollView3D()
            }

          }
 
          VStack {
            Text("Some details")
          }
        }
        .padding(.top, 64)
      }
  }

struct ScrollView3D: View {
  
  let meals = ["Breakfast", "Lunch", "Dinner", "More Lunch", "More Dinner"]
  var body: some View {
      
      ScrollView(.horizontal, showsIndicators: false) {
        
        HStack {
          
          ForEach(meals, id: \.self) { meal in
            GeometryReader{ geometry in
              
              let rot: Double = geometry.frame(in: .global).minX
              RoundedRectangle(cornerRadius: 8)
              //                Text(meal)
                .fill(.gray)
              //              .frame(width:400, height: 150)
              
                .overlay(Text(meal))
//                .rotation3DEffect(.degrees(rot / 5 + 20)
//                                  , axis: (x: 0.0, y: 1.0, z: 0))
              
                            .scrollTransition { content, phase in
                              content
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0.0: -50)
              
                            }
              
              //gr
            }
            .frame(width: 200, height: 150)


          }
          
        }
        
      }
      .scrollTargetBehavior(.paging)
  }
}
   

struct anotherView: View {
  var body: some View {
    ScrollView {
        ForEach(0..<50) { index in
            GeometryReader { geometry in
              let rot: Double = geometry.frame(in: .global).minY
                Text("Item \(index)")
                .rotation3DEffect(
                  
                  .degrees(rot),
                    axis: (x: 0, y: 1, z: 0)
                )
//              let width = geometry.size.width
//              print(rot)
            }
            .frame(height: 40)
        }
    }
  }
}




#Preview {
  HomeView()
}
      
      
//.scrollTransition { content, phase in
//  content
//    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
//                 y: phase.isIdentity ? 1.0 : 0.3)
//    .offset(y: phase.isIdentity ? 0.0: -50)
//  
//}

      
      
      
          //                  .rotation3DEffect(
          //                    .degrees( (proxy.frame(in: .global).minY) -fullView.size.height / 2) / 5
          //                    , axis: (x: 0.0, y: 1.0, z: 0))
          //
          //                    }







