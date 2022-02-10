//
//  SplashScreen.swift
//  DateAppSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 10/02/22.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            
            VStack{
            LottieView(filename: "fire")
                .frame(width: 200, height: 200)
                .offset(x: 0, y: 140)
                
                
                LottieView(filename: "load")
                    .frame(width: 300, height: 400)
                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
