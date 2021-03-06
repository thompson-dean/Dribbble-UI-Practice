//
//  ContentView.swift
//  DribbbleUIPractice
//
//  Created by Dean Thompson on 2022/06/18.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id = UUID()
    let imageString: String
    let title: String
    let description: String
}



var data: [Card] = [
    Card(imageString: "Abstract", title: "Geometry 3D Elements", description: "Hold up a rectangle piece of paper and ask all the favourite students."),
    Card(imageString: "Abstract", title: "Abstract 3D Elements", description: "An abstract may act as stand-alone entity instead of a full paper."),
    Card(imageString: "Abstract", title: "Geometry 3D Elements", description: "Hold up a rectangle piece of paper and ask all the favourite students."),
    Card(imageString: "Abstract", title: "Abstract 3D Elements", description: "An abstract may act as stand-alone entity instead of a full paper.")

]


struct ContentView: View {
   
    @State private var focusedButton = 0
    @State private var taskBarFocus = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "F8F8F8")
                    .ignoresSafeArea(.all)
                
                VStack {
                    Header()
                    
                    SearchBar()
                        
                    
                    Buttons(focusedButton: $focusedButton)
                        .padding(.top, 20)
                    
                    Cards()
                        .padding(.top, 15)
                    
                    TaskBar(taskBarFocus: $taskBarFocus)
                        .offset(y: 35)
                    

                }
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

//MARK: - HEADER
struct Header: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Good Morning, ")
                    .font(.system(size: 19, weight: .medium, design: .serif))
                    .foregroundColor(.accentColor)
                Text("Thompson")
                    .font(.system(size: 28, weight: .bold, design: .serif))
                    .foregroundColor(.accentColor)
            }
            
            Spacer()
            Image("Dean-KeyStone")
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .frame(width: 50, height: 50)
        }
        .padding(.horizontal, 30)
    }
}

//MARK: - SEARCH BAR
struct SearchBar: View {
    
   
    var body: some View {
        HStack {
            Text("Search for 3D products")
                .font(.system(size: 15, weight: .light, design: .serif))
                .foregroundColor(.gray.opacity(0.5))
                .padding(.leading, 20)
            
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 26, weight: .medium, design: .serif))
                .foregroundColor(.accentColor)
                .padding(.trailing, 20)
        }
        .frame(height:54)
        
        .background(.white)
        
        .cornerRadius(14)
        
        .padding(.horizontal, 30)
    }
}

//MARK: - Buttons

struct Buttons: View {
    
    @Binding var focusedButton: Int
    
    var body: some View {
        HStack(spacing: 30) {
            VStack {
                VStack {
                    Image(systemName: "clock")
                        .font(.system(size: 24))
                        .foregroundColor(focusedButton == 0 ? .white : .gray.opacity(0.5))
                }
                .frame(width: 60, height: 60)
                .background(focusedButton == 0 ? Color.accentColor : Color.white)
                .cornerRadius(10)
                Text("Recent")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundColor(focusedButton == 0 ? .accentColor : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .tag(0)
            .onTapGesture {
                focusedButton = 0
            }
            
            VStack {
                VStack {
                    Image(systemName: "flame")
                        .font(.system(size: 24))
                        .foregroundColor(focusedButton == 1 ? .white : .gray.opacity(0.5))
                }
                .frame(width: 60, height: 60)
                .background(focusedButton == 1 ? Color.accentColor : Color.white)
                .cornerRadius(10)
                Text("Trending")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundColor(focusedButton == 1 ? .accentColor : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .tag(1)
            .onTapGesture {
                focusedButton = 1
            }
            
            VStack {
                VStack {
                    Image(systemName: "crown")
                        .font(.system(size: 24))
                        .foregroundColor(focusedButton == 2 ? .white : .gray.opacity(0.5))
                }
                .frame(width: 60, height: 60)
                .background(focusedButton == 2 ? Color.accentColor : Color.white)
                .cornerRadius(10)
                Text("Popular")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundColor(focusedButton == 2 ? .accentColor : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .tag(2)
            .onTapGesture {
                focusedButton = 2
            }
            
            VStack {
                VStack {
                    Image(systemName: "diamond")
                        .font(.system(size: 24))
                        .foregroundColor(focusedButton == 3 ? .white : .gray.opacity(0.5))
                }
                .frame(width: 60, height: 60)
                .background(focusedButton == 3 ? Color.accentColor : Color.white)
                .cornerRadius(10)
                Text("Trending")
                    .font(.system(size: 12, weight: .bold, design: .serif))
                    .foregroundColor(focusedButton == 3 ? .accentColor : .gray.opacity(0.5))
                    .padding(.top, 5)
            }
            .tag(3)
            .onTapGesture {
                focusedButton = 3
            }


        }
    }
}


struct Cards: View {
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Recommended Products")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                    .foregroundColor(.accentColor)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(data, id: \.self) { item in
                        VStack {
                            Image(item.imageString)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .medium, design: .serif))
                                    .foregroundColor(.accentColor)
                                    .padding(.horizontal, 10)
                                Text(item.description)
                                    .font(.system(size: 15, weight: .medium, design: .serif))
                                    .lineLimit(3)
                                    .foregroundColor(.accentColor)
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 15)
                                
                            }
                            .frame(height: 100)
                            
                        }
                        .frame(width: 280, height: 340)
                        .background(Color.white)
                        .cornerRadius(25)
                        .padding(.leading, 30)
                    }
                }
                
            }
            
        }
    }
}

//MARK: - Task Bar

struct TaskBar: View {
    
    @Binding var taskBarFocus: Int
    
    var body: some View {
        HStack(spacing: 60) {
            
            VStack {
                Image(systemName: "house")
                    .font(.system(size: 26))
                Circle()
                    .frame(width: 5, height: 5)
                    .opacity(taskBarFocus == 0 ? 1 : 0)
            }
            .tag(0)
            .onTapGesture {
                taskBarFocus = 0
            }
            
            
            VStack {
                Image(systemName: "heart")
                    .font(.system(size: 26))
                Circle()
                    .frame(width: 5, height: 5)
                    .opacity(taskBarFocus == 1 ? 1 : 0)
            }
            .tag(1)
            .onTapGesture {
                taskBarFocus = 1
            }
            
            VStack {
                Image(systemName: "cube")
                    .font(.system(size: 26))
                Circle()
                    .frame(width: 5, height: 5)
                    .opacity(taskBarFocus == 2 ? 1 : 0)
            }
            .tag(2)
            .onTapGesture {
                taskBarFocus = 2
            }
            
            VStack {
                Image(systemName: "person")
                    .font(.system(size: 26))
                Circle()
                    .frame(width: 5, height: 5)
                    .opacity(taskBarFocus == 3 ? 1 : 0)
            }
            .tag(3)
            .onTapGesture {
                taskBarFocus = 3
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}
