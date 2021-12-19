//
//  MainView.swift
//  Drawer
//
//  Created by John Srishti on 11/12/21.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab : String = "Home"
    @State var showMenu: Bool = false
    
    //hiding native tab bar
    init(){
       
        UITabBar.appearance().isHidden =  true
    }
    
    var body: some View {
        ZStack{
            
            SideMenu(currentTab:  $currentTab)
           
            
            //main tab view
            CustomTabView(currentTab: $currentTab,showMenu:$showMenu)
                .cornerRadius(showMenu ? 25 : 0)
                //making 3d rotation
                .rotation3DEffect(.init(degrees: showMenu ? -15 : 0),
                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/,
                    anchor: .trailing
                )
                .offset(x: showMenu ? getRect().width/2 : 0)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
extension View{
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
         return safeArea
    }
}
