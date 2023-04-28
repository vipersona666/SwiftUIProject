//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Андрей Байдаченко on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                    
                }

            PlayerView()
                .tabItem {
                    Image(systemName: "music.quarternote.3")
                    Text("Player")
                }

            VideoView()
                .tabItem {
                    Image(systemName: "play.display")
                    Text("Video")
                }

            RecorderView()
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("Recorder")
                }
        }
    }
}
struct FeedView: View {
    @State private var isPushEnable = false
     @State private var isEditing = false
     @State private var speed = 50.0
     @State private var universe: Universe?
    var body: some View {
       
             VStack{
                 Form(){

                     Toggle(isOn: $isPushEnable) {
                         Text ("Push enable")
                     }
                     Slider(value: $speed, in: 0...100) { isEditing in
                         self.isEditing = isEditing
                     }
                     Text("\(speed)")
                         .foregroundColor(speed >= 80 ? .red : .green)
                     Button (action: {universe = .init(id: "1", name: "Marvel")}, label: { Text ("Marvel") })
                         .padding(10)
     
                     Button (action: {universe = .init(id: "2", name: "DC")}, label: { Text ("DC") })
                         .padding(10)
     
                         .alert(item: $universe) { universe in
                             Alert(title: Text("Вы выбрали \(universe.name)"), dismissButton: .default(Text("OK")))
                         }
     
                     Button(action:{}){
     
                         Text("Button")
                             .bold()
                             .font(Font.custom("Helvetica Neue", size: 24.0))
                             .padding(20)
                             .foregroundColor(Color.white)
                             .background(Color.red)
                             .cornerRadius(12)
                     }
                 }
             }
         }
    }

struct ProfileView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View{
        VStack(alignment: .center){
            VStack(alignment: .center){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(50)
            }
            
            VStack(spacing: 0){
                        TextField("Email or phone", text: $email)
                        .textFieldStyle(.roundedBorder)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        
                }
                .padding(40)
            Button(action:{}){

                Text("Button")
                    .bold()
                    .font(.headline)
                    .padding(60)
                    .frame(width: 320, height: 50)
                    .foregroundColor(Color.white)
                    .background(.blue)
                    .cornerRadius(12)
            }
           
        }
        
    }
}
struct PlayerView: View {
    var body: some View{
        
        VStack {
            Text("Header")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.orange)
            
            Text("Regular text")
                .fontWeight(.regular)
                .foregroundColor(.cyan)
        }
    }
}
struct VideoView: View {
    var body: some View {
        VStack {
            Text("Header")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Text("Regular text")
                .fontWeight(.regular)
            
        }
    }
}

struct RecorderView: View {
    var body: some View {
        VStack {
            Text("Header")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(20)
            Text("Regular text")
                .fontWeight(.regular)
                Spacer()
        }
    }
}
struct Universe: Identifiable{
    @State var id: String
    @State var name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
