//
//  ContentView.swift
//  VaporClientSide
//
//  Created by Navdeep Singh on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hexStringToUIColor(hex: "#29272E"))
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.flight, id: \.self) { value in
                            NavigationLink(destination: FlightDetailView(id: value.id)) {
                                HomeView(flight: value)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("DEL - DXB")
            }
            
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
            viewModel.getHomeData()
        }
    }
}

#Preview {
    ContentView()
}
