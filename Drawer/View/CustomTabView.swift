//
//  CustomTabView.swift
//  Drawer
//
//  Created by John Srishti on 11/12/21.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    
    @Binding var showMenu: Bool
    
    
   
    
    var body: some View {
        VStack{
            //static header
            HStack{
                Button{
                    //toggling menu options
                    withAnimation(.spring()){
                        showMenu = true
                    }
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.title2 )
                        .foregroundColor(.white)
                }
                Spacer()
                Button{} label:{Image("Pic").resizable().aspectRatio(contentMode: .fill).frame(width: 35, height: 35).cornerRadius(5)}
            }
            .padding([.horizontal,.top])
            .padding(.top,getSafeArea().top)
            .padding(.bottom,8)
            
            TabView(selection: $currentTab){
               
                Text("Home").tag("Home")
                Text("Discover").tag("Discover")
                Text("Devices").tag("Devices")
                Text("Profile").tag("Profile")
                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
