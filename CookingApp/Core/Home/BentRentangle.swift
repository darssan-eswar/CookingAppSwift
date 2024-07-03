//
//  BentRentangle.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/26/24.
//

import Foundation
import SwiftUI

struct BentRect: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
      
      // Bottom curve
      path.addQuadCurve(
        to: CGPoint(x: rect.maxX, y: rect.maxY),
        control: CGPoint(x: rect.midX, y: rect.maxY + 120))
      
      
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
      
      // TOP curve
      path.addQuadCurve(
        to: CGPoint(x: rect.minX, y: rect.minY),
        control: CGPoint(x: rect.midX, y: rect.minY + 80))
    }
  }
}


struct tmpView: View {
  var body: some View {
    BentRect()
      .fill(.gray)
      .frame(width:400, height: 150)
  }
}

#Preview {
  tmpView()
}
