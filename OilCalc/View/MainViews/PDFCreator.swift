//
//  PDFCreator.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 29/03/22.
//

import PDFKit
import UIKit

class PDFCreator: NSObject {
    func createPDF() -> Data {
      // dictionary with the PDF’s metadata using predefined keys.
      let pdfMetaData = [
        kCGPDFContextCreator: "Oil Calc",
        kCGPDFContextAuthor: "Galina Aleksandrova",
        //need to name as user want name it and a date
        kCGPDFContextTitle: "Soap recipe"
      ]
      //setting metadata
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]

      // setting the pdf doc size, remembering it use 72 points per inch
      let pageWidth = 8.3 * 72.0
      let pageHeight = 11.7 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

      // creating a pdfRenderer with the dimensions of the rectangle and the format containing the metadata.
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      // The renderer creates a Core Graphics context that becomes the current context within the block. Drawing done on this context will appear on the PDF.
      let data = renderer.pdfData { (context) in
        // 5
        context.beginPage()
        // 6
        let attributes = [
          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
        ]
        let text = "I'm a recipe pdf"
        text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
      }

      return data
    }
}
