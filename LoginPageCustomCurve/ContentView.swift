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
    @State var pass = ""
    @State var userName = ""
    @State var rePass = ""
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
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
                            signUp = false
                        }
                    }) {
                        Image(systemName: signUp ? "xmark" : "person.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("bgDark"))
                    }.offset(x: -108, y: -44)
                    .disabled(signUp ? false : true)
                    // for cancel button
                    Button(action: {
                        withAnimation(.easeOut) {
                            signUp = true
                        }
                    }) {
                        Image(systemName: signUp ? "person.badge.plus.fill" : "xmark")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                    }.offset(x: -25, y: -35)
                    .disabled(signUp ? true : false)
                }
                VStack(alignment: .leading, spacing: 25) {
                    Text("Login")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Username")
                        .foregroundColor(.white)
                        .padding(.top,10)
                    VStack {
                        TextField("UserName", text: $pass)
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    Text("Password")
                        .foregroundColor(.white)
                        .padding(.top,10)
                    VStack {
                        SecureField("Password", text: $pass)
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Text("Login")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("bgDark"))
                                .padding(.vertical)
                                .padding(.horizontal,45)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                        Spacer()
                    }
                    Spacer(minLength: 0)
                   
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 35)
                .padding()
                
            }
            .offset(y: signUp ? -UIScreen.main.bounds.height + (UIScreen.main.bounds.height < 750 ? 130 : 150) : 0)
            .zIndex(1)
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Sign Up")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color("bgDark"))
                
                Text("Username")
                    .foregroundColor(Color("bgDark"))
                    .padding(.top,10)
                VStack {
                    TextField("Password", text: $userName)
                    Divider()
                        .background(Color("bgDark").opacity(0.5))
                }
                
                Text("Password")
                    .foregroundColor(Color("bgDark"))
                    .padding(.top,10)
                VStack {
                    SecureField("Password", text: $pass)
                    Divider()
                        .background(Color("bgDark").opacity(0.5))
                }
                
                Text("Re-Enter Password")
                    .foregroundColor(Color("bgDark"))
                    .padding(.top,10)
                VStack {
                    SecureField("Re-Enter Password", text: $rePass)
                    Divider()
                        .background(Color("bgDark").opacity(0.5))
                }
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .padding(.horizontal,45)
                            .background(Color("bgDark"))
                            .clipShape(Capsule())
                    }
                    Spacer()
                }
                Spacer(minLength: 0)
               
            }
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 50)
            .padding()
            
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
//        .preferredColorScheme(signUp ? .light : .dark)
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
            
//            Path { path in
//            path.addArc(center: CGPoint(x: rect.width - 120, y: rect.height - 50), radius: 40, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
//            }
            
            
        }
    }
}
