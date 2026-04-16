//
//  ContentView.swift
//  Wishlist..
//
//  Created by Arjun Rana on 15/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext // provide the connection
    @Query private var wishes : [Wish] // update the widh
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(wishes) {
                    wish in
                    Text(wish.title)
                        .font(.title.weight(.light)).padding(.vertical , 2)
                        .swipeActions {
                            Button("Delete", role: .destructive){
                                modelContext.delete(wish)
                            }
                        }
                }
            }.navigationTitle("WishList")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            isAlertShowing.toggle()
                        }label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                    if wishes.isEmpty != true {
                        ToolbarItem(placement: .bottomBar){
                            Text("\(wishes.count)")
                        }
                    }
                }
                .alert("Create a new Wish", isPresented: $isAlertShowing){
                    TextField("Enter a wish", text: $title)
                    Button{
                        modelContext.insert(Wish(title: title))
                        title = ""
                    } label: {
                        Text("Save")
                    }
                }
                .overlay {
                    if wishes.isEmpty{
                        ContentUnavailableView("My WishList",systemImage: "heart.circle",
                        description: Text("No Wishes yet. Add one to get started"))
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
