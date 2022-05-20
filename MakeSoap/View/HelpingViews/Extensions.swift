//
//  Extensions.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 14/03/22.
//

import Foundation
import SwiftUI


//to hide search menu
public extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

extension View {
    
    func halfSheet<Content>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)?,
        content: @escaping () -> Content) -> some View where Content : View {
            modifier(
                halfSheetViewModifier(
                    isPresented: isPresented,
                    onDismiss: onDismiss,
                    content: content)
            )
        }
}

//extension UIColor {
//   static let greenCalcColor: Color = Color("AccentColor")
//}

//    .overlay {
//        ScrollView {
//            SearchOilMenu(editing: $editing, text: $oilVM.searchText)
//        }
//
//    }






//    SearchOilMenu(editing: $editing, text: $oilVM.searchText)
//                .overlay() {
//                    SearchOilMenu(editing: $editing, text: $oilVM.searchText, verticalOffset: vOffset, horizontalOffset: hOffset)
//                }
//            showMenu ?  SearchOilMenu(editing: $editing, text: $oilVM.searchText, verticalOffset: vOffset, horizontalOffset: hOffset) : nil
//

//            Text(oilVM.searchText)
//                .contextMenu {
//                    ForEach(oilVM.searchedOils, id: \.id) { o in
//                        Button(o.name) {
//                            oilVM.changeFavorite(oil: o)
//                            oilVM.calculateWeight()
//                        }
//
//                    }
//                }


//    .confirmationDialog("Find oil", isPresented: $showMenu, titleVisibility: .hidden) {
//        ForEach(oilVM.searchedOils, id: \.id) { oil in
//                        Button(oil.name) {
//                            oilVM.changeFavorite(oil: oil)
//                        }
//    }
//    }


//ForEach(oilVM.filteredOils, id: \.id) { o in
//    OilRow().environmentObject(o)
//        
//        .swipeActions {
//            //oilVM.saveFavorite(oil: o)
//            Button(role: .destructive, action: {
//                withAnimation {
//                    oilVM.changeFavorite(oil: o)
//                    oilVM.calculateWeight()
//                }
//               
//            } ) {
//                   Label("Delete", systemImage: "trash")
//                 }
//}
//}


//    .swipeActions {
//        //oilVM.saveFavorite(oil: o)
//        Button(role: .destructive, action: {
//            withAnimation {
//                oilVM.changeFavorite(oil: o)
//                oilVM.calculateWeight()
//            }
//           
//        } ) {
//               Label("Delete", systemImage: "trash")
//             }
//}
//Slider(
//    value: $oilVM.sfValue,
//           in: 0...20,
//           onEditingChanged: { editing in
//               oilVM.sfValueIsEditing = editing
//           }
//       )

//ForEach(soapProperties , id: \.id) { property in
//    HStack {
//        Text(property.name)
//            .modifier(Title2Modifier())
//        Button {
//
//        } label: {
//            Image(systemName: "questionmark.circle.fill")
//                .foregroundColor(.gray)
//                .font(.caption2)
//        }
//        Spacer()
//        Text("\(property.value, specifier: "%.0f")")
//            .font(.title3)
//        Spacer()
//            .frame(width: 90)
//        Text(property.recomendedValue)
//            .font(.title3)
//    }
//}

//struct SoapProperties: Identifiable {
//    let id = UUID()
//    var name: String
//    var recomendedValue: String
//    var value: Double
//    var recomendationRed: String
//    var recomendationGreen: String
//    var infoLabel: String
//}
 
//class soapProperties: ObservableObject {
//    let oilVM = OilViewModel()
//    @Published var soapProperties = [
//        //bubbly
//        SoapProperties(name: "Bubbly", recomendedValue: "15-30", value: oilVM.bubblyInd, recomendationRed: "BubblyRed", recomendationGreen: "BubblyGreen", infoLabel: "Bubbly")
//        //cleaning
//    //    SoapProperties(name: "Cleaning", recomendedValue: "15-20", value: oilVM.cleaningInd, recomendationRed: "cleaningRed", recomendationGreen: "cleaningGreen", infoLabel: "cleaning"),
//    //    //condition
//    //    SoapProperties(name: "Condition", recomendedValue: "45-70", value: oilVM.conditionInd, recomendationRed: "conditionRed", recomendationGreen: "conditionGreen", infoLabel: "condition"),
//    //    //hardness
//    //    SoapProperties(name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, recomendationRed: "hardnessRed", recomendationGreen: "hardnessGreen", infoLabel: "hardness"),
//    //    //longevity
//    //    SoapProperties(name: "Longevity", recomendedValue: "25-500", value: oilVM.longetivityInd, recomendationRed: "longevityRed", recomendationGreen: "longevityGreen", infoLabel: "longevity"),
//    //    //stability
//    //    SoapProperties(name: "Stabillity", recomendedValue: "15-50", value: oilVM.stabilityInd, recomendationRed: "stabillityRed", recomendationGreen: "stabillityGreen", infoLabel: "stabillity"),
//    //    //iodine
//    //    SoapProperties(name: "Iodine", recomendedValue: "up to 50", value: oilVM.iodineInd, recomendationRed: "iodineRed", recomendationGreen: "iodineGreen", infoLabel: "stabillity")
//        ]
//}




//        //Cleaning properties
//        HStack {
//            Text("Cleaning")
//                .modifier(Title2Modifier())
//            Button {
//                
//            } label: {
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.gray)
//                    .font(.caption2)
//            }
//            Spacer()
//            Text("\(oilVM.cleaningInd, specifier: "%.0f")")
//                .font(.title3)
//            Spacer()
//                .frame(width: 90)
//            Text("15-20")
//                .font(.title3)
//        }
//        //Condition properties
//        HStack {
//            Text("Condition")
//                .modifier(Title2Modifier())
//            Button {
//                
//            } label: {
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.gray)
//                    .font(.caption2)
//            }
//            Spacer()
//            Text("\(oilVM.conditionInd, specifier: "%.0f")")
//                .font(.title3)
//            Spacer()
//                .frame(width: 90)
//            Text("45-70")
//                .font(.title3)
//        }
//        //Hardness properties
//        HStack {
//            Text("Hardness")
//                .modifier(Title2Modifier())
//            Button {
//                
//            } label: {
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.gray)
//                    .font(.caption2)
//            }
//            Spacer()
//            Text("\(oilVM.hardnessInd, specifier: "%.0f")")
//                .font(.title3)
//            Spacer()
//                .frame(width: 90)
//                
//            Text("35-45")
//                .font(.title3)
//        }
//            //Longevity properties
//            HStack {
//                Text("Longevity")
//                    .modifier(Title2Modifier())
//                Button {
//                    
//                } label: {
//                    Image(systemName: "questionmark.circle.fill")
//                        .foregroundColor(.gray)
//                        .font(.caption2)
//                }
//                Spacer()
//                Text("\(oilVM.longevityInd, specifier: "%.0f")")
//                    .font(.title3)
//                Spacer()
//                    //.frame(width: 90)
//                    .frame(minWidth: 50, idealWidth: 90)
//                        .fixedSize()
//                Text("25-50")
//                    .font(.title3)
//            }
//            Group {
//            HStack {
//                Text("Stability")
//                    .modifier(Title2Modifier())
//                Button {
//                    showInfo.toggle()
//                } label: {
//                    Image(systemName: "questionmark.circle.fill")
//                        .foregroundColor(.gray)
//                        .font(.caption2)
//                }
//                
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.gray)
//                    .font(.caption2)
//                    .contextMenu {
//                        Text("How well the soap lathers")
//                    }
//                    
//                Spacer()
//                Text("\(oilVM.stabilityInd, specifier: "%.0f")")
//                    .font(.title3)
//                    .foregroundColor(oilVM.stabilityColor)
//                Spacer()
//                    .frame(width: 90)
//                Text("15-30")
//                    .font(.title3)
//            }
//            HStack {
//                Text("Iodine")
//                    .modifier(Title2Modifier())
//                Button {
//                    showInfo.toggle()
//                } label: {
//                    Image(systemName: "questionmark.circle.fill")
//                        .foregroundColor(.gray)
//                        .font(.caption2)
//                }
//                
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.gray)
//                    .font(.caption2)
//                    .contextMenu {
//                        Text("Iodine")
//                    }
//                    
//                Spacer()
//                Text("\(oilVM.iodineInd, specifier: "%.0f")")
//                    .font(.title3)
//                    .foregroundColor(oilVM.iodineColor)
//                Spacer()
//                    .frame(width: 90)
//                Text("up to 50")
//                    .font(.title3)
//            }
//            }




////
////  SuggestionHalfSheet.swift
////  OilCalc
////
////  Created by Galina Aleksandrova on 30/03/22.
////
//
//import SwiftUI
//
//struct SeggestionHalfSheet<Content: View> : View {
//    @GestureState private var dragState = DragState.inactive
//    @State var position = CardPosition.top
//
//    var content: () -> Content
//    var body: some View {
//        let drag = DragGesture()
//            .updating($dragState) { drag, state, transaction in
//                state = .dragging(translation: drag.translation)
//            }
//            .onEnded(onDragEnded)
//
//        return Group {
//            Handle()
//            self.content()
//        }
//        .frame(height: UIScreen.main.bounds.height)
//        .background(Color.white)
//        .cornerRadius(10.0)
//        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
//        .offset(y: self.position.rawValue + self.dragState.translation.height)
//        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
//        .gesture(drag)
//    }
//
//    private func onDragEnded(drag: DragGesture.Value) {
//        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
//        let cardTopEdgeLocation = self.position.rawValue + drag.translation.height
//        let positionAbove: CardPosition
//        let positionBelow: CardPosition
//        let closestPosition: CardPosition
//
//        if cardTopEdgeLocation <= CardPosition.middle.rawValue {
//            positionAbove = .top
//            positionBelow = .middle
//        } else {
//            positionAbove = .middle
//            positionBelow = .bottom
//        }
//
//        if (cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
//            closestPosition = positionAbove
//        } else {
//            closestPosition = positionBelow
//        }
//
//        if verticalDirection > 0 {
//            self.position = positionBelow
//        } else if verticalDirection < 0 {
//            self.position = positionAbove
//        } else {
//            self.position = closestPosition
//        }
//    }
//}
//
//enum CardPosition: CGFloat {
//    case top = 100
//    case middle = 500
//    case bottom = 850
//}
//
//enum DragState {
//    case inactive
//    case dragging(translation: CGSize)
//
//    var translation: CGSize {
//        switch self {
//        case .inactive:
//            return .zero
//        case .dragging(let translation):
//            return translation
//        }
//    }
//
//    var isDragging: Bool {
//        switch self {
//        case .inactive:
//            return false
//        case .dragging:
//            return true
//        }
//    }
//}
//
//struct Handle : View {
//    private let handleThickness = CGFloat(5.0)
//    var body: some View {
//        RoundedRectangle(cornerRadius: handleThickness / 2.0)
//            .frame(width: 40, height: handleThickness)
//            .foregroundColor(Color.secondary)
//            .padding(5)
//    }
//}
////
////  SuggestionHalfSheet.swift
////  OilCalc
////
////  Created by Galina Aleksandrova on 30/03/22.
////
//
//import SwiftUI
//
//struct SeggestionHalfSheet<Content: View> : View {
//    @GestureState private var dragState = DragState.inactive
//    @State var position = CardPosition.top
//
//    var content: () -> Content
//    var body: some View {
//        let drag = DragGesture()
//            .updating($dragState) { drag, state, transaction in
//                state = .dragging(translation: drag.translation)
//            }
//            .onEnded(onDragEnded)
//
//        return Group {
//            Handle()
//            self.content()
//        }
//        .frame(height: UIScreen.main.bounds.height)
//        .background(Color.white)
//        .cornerRadius(10.0)
//        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
//        .offset(y: self.position.rawValue + self.dragState.translation.height)
//        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
//        .gesture(drag)
//    }
//
//    private func onDragEnded(drag: DragGesture.Value) {
//        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
//        let cardTopEdgeLocation = self.position.rawValue + drag.translation.height
//        let positionAbove: CardPosition
//        let positionBelow: CardPosition
//        let closestPosition: CardPosition
//
//        if cardTopEdgeLocation <= CardPosition.middle.rawValue {
//            positionAbove = .top
//            positionBelow = .middle
//        } else {
//            positionAbove = .middle
//            positionBelow = .bottom
//        }
//
//        if (cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
//            closestPosition = positionAbove
//        } else {
//            closestPosition = positionBelow
//        }
//
//        if verticalDirection > 0 {
//            self.position = positionBelow
//        } else if verticalDirection < 0 {
//            self.position = positionAbove
//        } else {
//            self.position = closestPosition
//        }
//    }
//}
//
//enum CardPosition: CGFloat {
//    case top = 100
//    case middle = 500
//    case bottom = 850
//}
//
//enum DragState {
//    case inactive
//    case dragging(translation: CGSize)
//
//    var translation: CGSize {
//        switch self {
//        case .inactive:
//            return .zero
//        case .dragging(let translation):
//            return translation
//        }
//    }
//
//    var isDragging: Bool {
//        switch self {
//        case .inactive:
//            return false
//        case .dragging:
//            return true
//        }
//    }
//}
//
//struct Handle : View {
//    private let handleThickness = CGFloat(5.0)
//    var body: some View {
//        RoundedRectangle(cornerRadius: handleThickness / 2.0)
//            .frame(width: 40, height: handleThickness)
//            .foregroundColor(Color.secondary)
//            .padding(5)
//    }
//}
////
////  SuggestionHalfSheet.swift
////  OilCalc
////
////  Created by Galina Aleksandrova on 30/03/22.
////
//
//import SwiftUI
//
//struct SeggestionHalfSheet<Content: View> : View {
//    @GestureState private var dragState = DragState.inactive
//    @State var position = CardPosition.top
//
//    var content: () -> Content
//    var body: some View {
//        let drag = DragGesture()
//            .updating($dragState) { drag, state, transaction in
//                state = .dragging(translation: drag.translation)
//            }
//            .onEnded(onDragEnded)
//
//        return Group {
//            Handle()
//            self.content()
//        }
//        .frame(height: UIScreen.main.bounds.height)
//        .background(Color.white)
//        .cornerRadius(10.0)
//        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
//        .offset(y: self.position.rawValue + self.dragState.translation.height)
//        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
//        .gesture(drag)
//    }
//
//    private func onDragEnded(drag: DragGesture.Value) {
//        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
//        let cardTopEdgeLocation = self.position.rawValue + drag.translation.height
//        let positionAbove: CardPosition
//        let positionBelow: CardPosition
//        let closestPosition: CardPosition
//
//        if cardTopEdgeLocation <= CardPosition.middle.rawValue {
//            positionAbove = .top
//            positionBelow = .middle
//        } else {
//            positionAbove = .middle
//            positionBelow = .bottom
//        }
//
//        if (cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
//            closestPosition = positionAbove
//        } else {
//            closestPosition = positionBelow
//        }
//
//        if verticalDirection > 0 {
//            self.position = positionBelow
//        } else if verticalDirection < 0 {
//            self.position = positionAbove
//        } else {
//            self.position = closestPosition
//        }
//    }
//}
//
//enum CardPosition: CGFloat {
//    case top = 100
//    case middle = 500
//    case bottom = 850
//}
//
//enum DragState {
//    case inactive
//    case dragging(translation: CGSize)
//
//    var translation: CGSize {
//        switch self {
//        case .inactive:
//            return .zero
//        case .dragging(let translation):
//            return translation
//        }
//    }
//
//    var isDragging: Bool {
//        switch self {
//        case .inactive:
//            return false
//        case .dragging:
//            return true
//        }
//    }
//}
//
//struct Handle : View {
//    private let handleThickness = CGFloat(5.0)
//    var body: some View {
//        RoundedRectangle(cornerRadius: handleThickness / 2.0)
//            .frame(width: 40, height: handleThickness)
//            .foregroundColor(Color.secondary)
//            .padding(5)
//    }
//}



//func createCircle() -> UIImage {
//    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 60, height: 60))
//    let rectangle = CGRect(x: 0, y: 0, width: 60, height: 60)
//    let img = renderer.image { (context) in
//        UIColor.green.setStroke()
//        context.cgContext.addEllipse(in: rectangle)
//        context.cgContext.drawPath(using: .stroke)
//
//    }
//
//    return img
//}




//func addImageWithoutScaling (image: UIImage, pageRect: CGRect, xPosition: CGFloat, yPosition: CGFloat) {
//    let rectangle = CGRect(x: xPosition, y: yPosition,
//                           width: image.size.width, height: image.size.height)
//
//    image.draw(in: rectangle)
//}


//
//func addImage(pageRect: CGRect, imageTop: CGFloat)  {
//
//    let maxHeight = pageRect.height
//    let maxWidth = pageRect.width
//    // 2
//    if let imageUnwrapped = image {
//        let aspectWidth = maxWidth / imageUnwrapped.size.width
//        let aspectHeight = maxHeight / imageUnwrapped.size.height
//        let aspectRatio = min(aspectWidth, aspectHeight)
//        // 3u
//        let scaledWidth = imageUnwrapped.size.width * aspectRatio
//        let scaledHeight = imageUnwrapped.size.height * aspectRatio
//        // 4
//        let imageX = (pageRect.width - scaledWidth) / 2.0
//        let imageRect = CGRect(x: imageX, y: imageTop,
//                               width: scaledWidth, height: scaledHeight)
//        // 5
//        imageUnwrapped.draw(in: imageRect)
//        //imageUnwrapped.draw(in: T##CGRect)
//
//        //return imageRect.origin.y + imageRect.size.height
//    } else {
//        print("No image found")
//        // return 0
//    }
//
//
//}
