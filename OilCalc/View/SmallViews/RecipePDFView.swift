//
//  jhhgj.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 29/03/22.
//

import SwiftUI
import PDFKit

let pdfcreator = PDFCreator()

struct RecipePDFView: UIViewRepresentable {

    var documentData: Data? =  pdfcreator.createPDF()
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        if let data = documentData {
          pdfView.document = PDFDocument(data: data)
          pdfView.autoScales = true
        }
        return pdfView
    }
    
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        //
    }
    
    typealias UIViewType = PDFView
    
    
}

struct jhhgj_Previews: PreviewProvider {
    static var previews: some View {
        RecipePDFView()
    }
}
