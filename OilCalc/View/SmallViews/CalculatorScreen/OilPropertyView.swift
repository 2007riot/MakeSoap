//
//  OilPropertyView.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import SwiftUI

struct OilPropertyView: View {
    var oil: Oil
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                Text("\(oil.name)")
                    .modifier(Title2Modifier())
                
                
                //            Spacer()
                //                .frame(height: 10)
                
                Text("Properties")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Bubbly")
                        Spacer()
                        Text("\(oil.bubbly, specifier: "%.0f") %").bold()
                    }
                    HStack {
                        Text("Cleaning")
                        Spacer()
                        Text("\(oil.cleaning, specifier: "%.0f") %").bold()
                    }
                    HStack {
                        Text("Condition")
                        Spacer()
                        Text("\(oil.condition, specifier: "%.0f") %").bold()
                    }
                    HStack {
                        Text("Hardness")
                        Spacer()
                        Text("\(oil.hardness, specifier: "%.0f") %").bold()
                    }
                    HStack {
                        Text("Longevity")
                        Spacer()
                        Text("\(oil.longevity, specifier: "%.0f") %").bold()
                    }
                    HStack {
                        Text("Stability")
                        Spacer()
                        Text("\(oil.stability, specifier: "%.0f") %").bold()
                    }
                    
                }
                
                    Text("Fatty Acids:")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Lauric")
                            Spacer()
                            Text("\(oil.Lauric, specifier: "%.0f") %").bold()
                        }
                        HStack {
                            Text("Linoleic")
                            Spacer()
                            Text("\(oil.Linoleic, specifier: "%.0f") %").bold()
                        }
                        HStack {
                            Text("Myristic")
                            Spacer()
                            Text("\(oil.Myristic, specifier: "%.0f") %").bold()
                        }
                        HStack {
                            Text("Oleic")
                            Spacer()
                            Text("\(oil.Oleic, specifier: "%.0f") %").bold()
                        }
                    
                        HStack {
                            Text("Palmitic")
                            Spacer()
                            Text("\(oil.Palmitic, specifier: "%.0f") %").bold()
                        }
                }
            }
        }
    }
    
}

