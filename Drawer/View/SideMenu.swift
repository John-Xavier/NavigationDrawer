//
//  SideMenu.swift
//  Drawer
//
//  Created by John Srishti on 11/12/21.
//

import SwiftUI

struct SideMenu: View {
    @Binding var currentTab: String
    @Namespace var animation
    var body: some View {
        
        VStack{
            HStack(spacing:15){
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("iJustine")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                 
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(getRect().height < 750 ? /*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/ : .init(), showsIndicators: false){
                //tab buttons
               VStack(alignment: .leading, spacing: 10){
                   customtabButton(icon: "theatermasks.fill", title: "Home")
                   customtabButton(icon: "safari.fill", title: "Discover")
                   customtabButton(icon: "applewatch", title: "Devices")
                   customtabButton(icon: "person.fill", title: "Profile")
                   customtabButton(icon: "gearshape.fill", title: "Setting")
                   customtabButton(icon: "info.circle.fill", title: "About")
                   customtabButton(icon: "questionmark.circle.fill", title: "Help")
                   Spacer()
                   customtabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
               }
               .padding()
               .padding(.top,60 )
               //max width of screen width
               .frame(width:getRect().width/2,alignment: .leading)
               .frame(maxWidth:.infinity,alignment: .leading)
            }
            
        }
        .padding(.leading,10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).background(
            Color("BG")
        )
    }
    //custom button
    @ViewBuilder
    func  customtabButton(icon:String, title:String)-> some View{
        Button{
            if title == "Logout"{
                
            }else{
                withAnimation(){
                    currentTab = title
                }
            }
           
        } label: {
            HStack(spacing:12){
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil, height: 48)
                    .foregroundColor(currentTab == title ? .purple : (title == "Logout" ? .orange : .white))
                    .background(
                        ZStack{
                            if currentTab == title{
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "Logout" ? .orange : .white)
                
            }
            .padding(.trailing,18)
            .background(
                ZStack{
                    if currentTab == title{
                        Color("Purple")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
            )
        }
        .offset(x:currentTab == title ? 15 : 0)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
       MainView()
    }
}

//extending view to get screen bounds
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
