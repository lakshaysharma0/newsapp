//
//  ContentView.swift
//  H4XOR News
//
//  Created by lakshay sharma on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NewtorkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("H4XOR News")
        }
        
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

#Preview {
    ContentView()
}

//let posts = [
//    Post(id: "1", title: "a"),
//    Post(id: "2", title: "b"),
//    Post(id: "3", title: "c")
//]
