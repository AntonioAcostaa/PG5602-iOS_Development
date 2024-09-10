//
//  HomeView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import Foundation
import SwiftUI

enum ClothingType: String, CaseIterable, Identifiable {
    
    public var id: String {
        return rawValue
    }
    
    
    case klær = "Klær"
    case sko = "Sko"
    case accessories = "Accessories"
    case streetwear = "Streetwear"
    
}


struct HomeView: View {
    var body: some View {
        
        VStack {
            
            ZStack {
                Color.orange
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Kickstart høsten")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Spar opptil 50% på tusenvis av varer")
                            .font(.title)
                    }
                    .padding(.leading)
                    Spacer()
                    
                }
            }
            .foregroundStyle(.white)
            .frame(height: 160)
            
            
            
            ZStack {
                Color("secondaryOrange")
                
                VStack {
                    Text("Oppdag mer:")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ClothingType.allCases) {
                                clothingType in
                            
                            }
//                            Button(action: {
//                                print("Trykka knappen klær")
//                            }, label: {
//                                Text("Klær")
//                            })
//                            
//                            Button(action: {
//                                print("Trykka knappen sko")
//                                
//                            }, label: {
//                                Text("Sko")
//                            })
                            
                        }
                        .fontWeight(.bold)
                    }
                }
                .foregroundStyle(.white)
            }
            
            productCategoryList
            
            
        }
        
    } // body
    
    var productCategoryList: some View {
        ZStack {
            Color.white
            VStack {
                Text("Hvem shopper du til?")
                Text("Gutt, jente eller baby")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            print("trykka baby 0-12 mnd")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("baby")
                                    ZStack {
                                        Color.blue
                                        Text("Baby (0-12 måneder)")
                                    }
                                }
                                
                            }
                        })
                        
                        
                        Button(action: {
                            print("trykka jente (1-3 år)")
                        }, label: {
                            ZStack {
                                VStack {
                                    
                                    Image("baby")
                                    ZStack {
                                        Color.red
                                        Text("Jente (1-3 år)")
                                    }
                                }
                                
                            }
                        })
                        
                    }
                    
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
