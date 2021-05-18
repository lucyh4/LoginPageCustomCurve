//
//  ContentView.swift
//  LoginPageCustomCurve
//
//  Created by Neha on 18/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var signUp = false
    var body: some View {
        ZStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                Color("bgDark")
                    .clipShape(CShape())
                // curve
                Path { path in
                    path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 120, y: UIScreen.main.bounds.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                } .fill(Color.white)
                // for person button
                Button(action: {
                    withAnimation(.easeIn) {
                        signUp = true
                    }
                }, label: {
                    Image(systemName: signUp ? "xmark" : "person.fill")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("bgDark"))
                }).offset(x: -108, y: -44)
                // for cancel button
                Button(action: {
                    withAnimation(.easeOut) {
                        signUp = false
                    }
                }, label: {
                    Image(systemName: signUp ? "person.badge.plus.fill" : "xmark")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                }).offset(x: -25, y: -35)
                
               
            }
            .offset(y: signUp ? -UIScreen.main.bounds.height + 130 : 0)
            
        }.background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

//Custom Shape

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
//            print(rect.width, rect.height)
            // for filling only top part with color
            path.move(to: CGPoint(x: rect.width, y: rect.height - 50))
            path.addLines([CGPoint(x: rect.width, y: rect.height - 50),CGPoint(x: rect.width, y: 0), CGPoint(x: 0, y: 0), CGPoint(x: 0, y: rect.height - 50)])
            
            // curve
            path.addArc(center: CGPoint(x: rect.width - 40, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
            
            
        }
    }
}
