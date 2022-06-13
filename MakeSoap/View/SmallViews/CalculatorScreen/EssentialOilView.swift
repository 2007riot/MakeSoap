//
//  EssentialOilView.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import SwiftUI
import PartialSheet

struct EssentialOilView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var editing: Bool = false
    @State private var isShowingEsoilInfo = false
    
    let iPhoneStyle = PSIphoneStyle(
        background: .solid(Color(uiColor: .systemBackground)),
        handleBarStyle: .none,
        cover: .enabled(Color.black.opacity(0.2)),
        cornerRadius: 10
    )
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Essential Oils")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    isShowingEsoilInfo.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .partialSheet(isPresented: $isShowingEsoilInfo,
                              type: .scrollView(height: 170, showsIndicators: false),
                              iPhoneStyle: iPhoneStyle,
                              content: {
                    EsOilInfoView()
                        .padding()
                })
            } else {
                Button {
                    isShowingEsoilInfo.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .popover(isPresented: $isShowingEsoilInfo) {
                    EsOilInfoView()
                        .padding()
                }
            }
        }
        ) {
            VStack {
                TextField("Find Essential Oil", text: $oilVM.inputTextEsOil, onEditingChanged: { edit in
                    
                    self.editing = edit
                    
                })
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                
                SearchView(editing: $editing, inputText: $oilVM.inputTextEsOil, searchFor: essentialOilSearch)
                
                ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                    
                    EssentialOilRow().environmentObject(esOil)
                    
                }
            }
        } .groupBoxStyle(CalculatorGroupBoxStyle())
    }
}


struct EssentialOilView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        EssentialOilView()
            .environmentObject(oilVM)
    }
}
