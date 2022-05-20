////
////  MainView.swift
////  modalview
////
////  Created by Galina Aleksandrova on 27/04/22.
////
//
//import SwiftUI
//
//struct MainView: View {
//    @State var showingSheet = false
//    var body: some View {
//        VStack {
//            ContentView(showingSheet: $showingSheet)
//            Text ("Something")
//            Button {
//                //do nothing
//            } label: {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(.brown)
//                        .frame(minWidth: 150, idealWidth: .infinity, maxWidth: .infinity, minHeight: 55, idealHeight: 55, maxHeight: 55, alignment: .center)
//                        .padding()
//                    
//                    Text("Nothing")
//                        .foregroundColor(.white)
//                        .font(.title3)
//                        .bold()
//                }
//            }
//        }
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
