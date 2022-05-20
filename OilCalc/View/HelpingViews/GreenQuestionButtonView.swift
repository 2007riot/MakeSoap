//
//  GreenQuestionButton.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 09/05/22.
//

import SwiftUI

struct GreenQuestionButtonView: View {
    var body: some View {
        
            Image(systemName: "questionmark.circle.fill")
                .foregroundColor(.accentColor)
                .font(.caption2)
        
    }
}

struct ShowInfoButton_Previews: PreviewProvider {
    static var previews: some View {
        GreenQuestionButtonView()
    }
}
