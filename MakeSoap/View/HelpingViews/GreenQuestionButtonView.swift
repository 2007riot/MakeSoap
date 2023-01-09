//
//  GreenQuestionButton.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import SwiftUI

struct GreenQuestionButtonView: View {
    
    @Binding var isToggled: Bool
    var body: some View {
       
            Button {
                isToggled.toggle()
            } label: {
                Image(systemName: "questionmark.circle.fill")
                
                    .foregroundColor(.accentColor)
                    .font(.caption2)
            }
            
           
        
        }
        
    }


struct ShowInfoButton_Previews: PreviewProvider {
    static var previews: some View {
        GreenQuestionButtonView(isToggled: .constant(true))
    }
}
