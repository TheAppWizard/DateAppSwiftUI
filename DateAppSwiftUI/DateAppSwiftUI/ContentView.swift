//
//  ContentView.swift
//  DateAppSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 10/02/22.
//
//  MARK: The App Wizard
//  Instagram :
//  MARK: @theappwizard2408

import SwiftUI




struct ContentView: View {
    var body: some View {
        ZStack{
            MainView()
        }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}















struct MainView: View {
    @State var splashScreen  = true

    var body: some View {
         ZStack{
            Group{
              if splashScreen {
                  SplashScreen()
               }
              else{
                  ZStack{
                      Color.black.edgesIgnoringSafeArea(.all)
                      CombineView()
                  }
                    }
                }
               .onAppear {
                  DispatchQueue
                       .main
                       .asyncAfter(deadline:
                                        .now() + 2.5) {
                    splashScreen = false
                  }
                }
            }
        }
    }








struct CombineView: View {
    var body: some View {
        ZStack{
            VStack{
                HeaderSection()
                FilterSection()
                Spacer()
                    .frame(width: 0, height: 30)
                Home()
                
            }
        }
    }
}


struct HeaderSection: View {
    @State private var heartTap = false
    var body: some View {
        HStack{
            
            
            LottieView(filename: "fire")
                .frame(width: 40, height: 50)
            
            
            Text("S W I P E")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Spacer().frame(width: 170, height: 0)
            
            ZStack{
            Image(systemName: "message.fill")
                .foregroundColor(.white)
                .font(.system(size: 30))
                
                
                Circle().frame(width: 15, height: 15)
                    .foregroundColor(.red)
                    .offset(x: 10, y: -10)
                
            }
             
        }
    }
}


struct FilterSection: View {
    var body: some View {
        ZStack{
         RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray)
                .frame(width: 380, height: 50)
                .opacity(0.1)
                .overlay {
                    RoundedRectangle(cornerRadius: 8).stroke(.white, lineWidth: 1)
                            }
            
            
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white.opacity(1))
                    .font(.system(size: 25))
                
                Spacer().frame(width: 20, height: 0)
                
                Text("S E A R C H")
                    .foregroundColor(.white)
                    .opacity(0.4)
                
                Spacer()
                
            }.offset(x: 40, y: 0)
        }
    }
}
