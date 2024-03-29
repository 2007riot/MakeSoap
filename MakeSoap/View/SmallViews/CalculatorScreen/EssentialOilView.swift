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
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Essential Oils")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                
                if #available(iOS 16, *) {
                    GreenQuestionButtonView(isToggled: $isShowingEsoilInfo)
                        .sheet(isPresented: $isShowingEsoilInfo) {
                            EsOilInfoView()
                                .presentationDetents([.height(UIScreen.main.bounds.height * 0.2)])
                                .padding()
                        }
                } else {
                    GreenQuestionButtonView(isToggled: $isShowingEsoilInfo)
                        .partialSheet(isPresented: $isShowingEsoilInfo,
                                      type: .scrollView(height: UIScreen.main.bounds.height * 0.2, showsIndicators: false),
                                      iPhoneStyle: UIConstants.iPhoneStyle,
                                      content: {
                            EsOilInfoView()
                                .padding()
                        })
                }
            } else {
                GreenQuestionButtonView(isToggled: $isShowingEsoilInfo)
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
                
                SearchView(editing: $editing, inputText: $oilVM.inputTextEsOil, searchFor: .essentialOil)
                
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
