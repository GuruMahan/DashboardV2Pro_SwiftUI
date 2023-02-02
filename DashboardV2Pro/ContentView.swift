//
//  ContentView.swift
//  DashboardV2Pro
//
//  Created by Guru Mahan on 13/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var isLoaderShown = false
    @State var  showLeftMenu = false
    var body: some View {
        NavigationView {
            ZStack {
                dashBoardView
                LeftSideView(isMenuVisible: $showLeftMenu)

             Spacer()
              
            }
            .onAppear{
                isLoaderShown = false
            }
        }
        
    }
    @ViewBuilder var dashBoardView: some View{
        VStack(spacing:0){
            Color.blue
                .frame(height: UIScreen.main.safeAreaInsets.top)
            headerView
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .loader(isShown: $isLoaderShown)
    }
   

    @ViewBuilder var headerView: some View{
        ZStack{
            Text("Dashboard")
            HStack{
                Button {
                    withAnimation {
                        DispatchQueue.main.async {
                           showLeftMenu = true
                          
                        }
                    }
                } label: {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 30))
                }
              Spacer()
                   
            }
        }
        .padding()
            .foregroundColor(.white)
            .frame(height: 55)
            .background(Color.blue)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
    var safeAreaInsets: UIEdgeInsets {
        let first = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return first?.safeAreaInsets ?? .zero
    }
}
