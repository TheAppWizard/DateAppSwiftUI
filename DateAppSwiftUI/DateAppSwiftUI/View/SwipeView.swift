//
//  SwipeView.swift
//  DateAppSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 10/02/22.
//

import SwiftUI

struct SwipeView: View {
    var body: some View {
        Home()
           
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}


struct Home: View {
    
    //Marvel Actress Data
       @State var profiles = [
           Profile(id: 0,
                   name: "Natalie Portman",
                   image: "p0",
                   age: "35",
                   offset: 0),
           Profile(id: 1,
                   name: "karen Gillan",
                   image: "p1",
                   age: "30",
                   offset: 0),
           Profile(id: 2,
                   name: "Hayley Atwell",
                   image: "p2",
                   age: "35",
                   offset: 0),
           Profile(id: 3,
                   name: "Zoe Saldana",
                   image: "p3",
                   age: "35",
                   offset: 0),
           Profile(id: 4,
                   name: "Elizabeth Olsen",
                   image: "p4",
                   age: "29",
                   offset: 0),
           Profile(id: 5,
                   name: "Brie Larson",
                   image: "p5",
                   age: "29",
                   offset: 0),
           Profile(id: 6,
                   name: "Gwyneth Paltrow",
                   image: "p6",
                   age: "35",
                   offset: 0),
           Profile(id: 7,
                   name: "Scarlett Johansson",
                   image: "p7",
                   age: "35",
                   offset: 0),
           Profile(id: 8,
                   name: "Evangeline Lily",
                   image: "p8",
                   age: "38",
                   offset: 0),
           Profile(id: 9,
                   name: "Cobie Smulders",
                   image: "p9",
                   age: "38",
                   offset: 0),
           Profile(id: 10,
                   name: "Hailee Steinfeld",
                   image: "p10",
                   age: "28",
                   offset: 0),
           Profile(id: 11,
                   name: "Anne Hathway",
                   image: "p11",
                   age: "30",
                   offset: 0),
           Profile(id: 12,
                   name: "Amber Heard",
                   image: "p12",
                   age: "30",
                   offset: 0),
           Profile(id: 13,
                   name: "Margot Robie",
                   image: "p13",
                   age: "30",
                   offset: 0),
           Profile(id: 14,
                   name: "Gal Gadot",
                   image: "p14",
                   age: "30",
                   offset: 0),
       ]
       
       var body: some View{
           VStack{
              
               GeometryReader{g in
                   
                   ZStack{
                       
                       ForEach(profiles.reversed()){profile in
                           
                           ProfileView(profile: profile,frame: g.frame(in: .global))
                       }
                   }
               }
               .padding([.horizontal,.bottom])
           }
           .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
       }
   }

struct ProfileView : View {
     @State private var animationAmount: CGFloat = 1
     @State var profile : Profile
     var frame : CGRect
     var body: some View{
  
          ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
              
              Image(profile.image)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: frame.width,height: frame.height)
//                  .frame(width: 300,height: 700)
             
              ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                  
                (profile.offset > 0 ? Color.green : Color.red).opacity(0.8)
                      .opacity(profile.offset != 0 ? 0.7 : 0)
                  
                  HStack{
                      
                      if profile.offset < 0{
                          Spacer()
                      }
                      
                      Text(profile.offset == 0 ? "" : (profile.offset > 0 ? "Selected" : "Rejected"))
                          .font(.title)
                          .fontWeight(.bold)
                          .foregroundColor(.white)
                          .padding(.top, 25)
                          .padding(.horizontal)
                      
                      if profile.offset > 0 {
                          
                          Spacer()
                      }
                  }
              })
   
              VStack(spacing: 20){
                  
                  
                  HStack{
                      
                      VStack(alignment: .leading,spacing: 12){
                          
                          Text(profile.name)
                              .font(.title)
                              .fontWeight(.bold)
                          
                          Text(profile.age + " +")
                              .fontWeight(.bold)
                      }
                      .foregroundColor(.white)
                      
                      
                     Spacer()
                  }.padding()
                  
                  
                  //Buttons HStack
                  HStack(spacing: 30){
                      
                      Image(systemName: "arrow.2.squarepath")
                          .font(.system(size: 20))
                          .foregroundColor(.white)
                          .padding(.all,20)
                          .background(Color.blue)
                          .clipShape(Circle())
                     
                     
                    //Button Red
                    Button(action: {
                          withAnimation(Animation.easeIn(duration: 0.8)){
                              
                              profile.offset = -500
                          }
                          
                      }, label: {
                          
                          Image(systemName: "xmark")
                              .font(.system(size: 24, weight: .bold))
                              .foregroundColor(.white)
                              .padding(.all,20)
                              .background(Color.red)
                              .clipShape(Circle())
                      })
                    
                    
                    
                    
                       
                   //Button Green
                    Button(action: {
                          withAnimation(Animation.easeIn(duration: 0.8)){
                              profile.offset = 500
                          }
                          
                      }, label: {
                          
                          Image(systemName: "heart.fill")
                              .font(.system(size: 24))
                              .foregroundColor(.white)
                              .padding(.all,20)
                              .background(Color.green)
                              .clipShape(Circle())
                            
                      })
                      
                    
                      
                      Image(systemName: "star.fill")
                          .font(.system(size: 20))
                          .foregroundColor(.white)
                          .padding(.all,20)
                          .background(Color.yellow)
                          .clipShape(Circle())
                      
                      
                  }
              }.background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                 
         
              
              
              
          })
          .cornerRadius(20)
          .offset(x: profile.offset)
          .rotationEffect(.init(degrees: profile.offset == 0 ? 0 : (profile.offset > 0 ? 12 : -12)))
          .gesture(
          
              DragGesture()
                  .onChanged({ (value) in
                      
                      withAnimation(.default){
                          profile.offset = value.translation.width
                      }
                  })
                  .onEnded({ (value) in
                      
                      withAnimation(.easeIn){
                      
                        
                        //Profile Offset Conditions
                          if profile.offset > 150{
                              profile.offset = 500
                          }
                          else if profile.offset < -150{
                              profile.offset = -500
                          }
                          else{
                              profile.offset = 0
                          }
                      }
                  })
          )
      }
  }
  
