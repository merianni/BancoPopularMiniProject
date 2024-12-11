//
//  WelcomeView.swift
//  BancoPopularWelcome
//
//  Created by Merianni Nunez Tejeda on 12/10/24.
//
import SwiftUI

struct WelcomeView: View {
    let themeColor = Color(red: 27/255, green: 97/255, blue: 161/255)
    
   var body: some View {
       NavigationView{
           VStack{
               Spacer()
               
               Image(systemName: "sparkles")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 75, height: 75)
                   .foregroundColor(themeColor)
               
               Text("Welcome to Banco Popular")
                   .font(.title)
                   .foregroundColor(themeColor)
                   .fontWeight(.bold)
                   .padding(.top, 16)
               
               Text("Experience the best features, tailored for you.")
                   .font(.body)
                   .multilineTextAlignment(.center)
                   .foregroundColor(.gray)
                   .padding(.horizontal, 32)
                   .padding(.top, 8)
               
               Spacer()
               
               NavigationLink(destination: SignUpView()) {
                   Text("Accept")
                       .font(.headline)
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(themeColor)
                       .cornerRadius(12)
                       .padding(.horizontal, 24)
                       .shadow(color: Color.black.opacity(0.2), radius: 8, x:0, y:4)
                   
               }
               .padding(.bottom, 32)
           }

       }
    }
}


#Preview {
    WelcomeView()
}
