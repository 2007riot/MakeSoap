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
        
        ScrollView(showsIndicators: false) {
            if UIDevice.current.userInterfaceIdiom == .phone {
            VStack (alignment: .leading, spacing: 10) {
                oilProperties
                oilFattyAcids
            }
            } else {
                VStack {
                    HStack(alignment: .top) {
                    oilProperties
                            .frame(minWidth:200)
                        Spacer()
                            .frame(minWidth: 100)
                    oilFattyAcids
                            .frame(minWidth:200)
                }
                }
            }
        }
    }
    
    var oilProperties: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Properties")
                .font(.headline)
            HStack {
                Text("Hardness")
                Spacer()
                Text("\(oil.hardness, specifier: "%.0f") %").bold()
            }
            HStack {
                Text("Condition")
                Spacer()
                Text("\(oil.condition, specifier: "%.0f") %").bold()
            }
            HStack {
                Text("Bubbly")
                Spacer()
                Text("\(oil.bubbly, specifier: "%.0f") %").bold()
            }
            HStack {
                Text("Cleansing")
                Spacer()
                Text("\(oil.cleaning, specifier: "%.0f") %").bold()
            }
            HStack {
                Text("Stability")
                Spacer()
                Text("\(oil.stability, specifier: "%.0f") %").bold()
            }
            HStack {
                Text("Longevity")
                Spacer()
                Text("\(oil.longevity, specifier: "%.0f") %").bold()
            }
        }
    }
    
    var oilFattyAcids: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Fatty Acids:")
                .font(.headline)
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

struct OilPropertyView_Previews: PreviewProvider {
    
    static var previews: some View {
        OilPropertyView(oil: Oil.example())
            .padding()
    }
}
