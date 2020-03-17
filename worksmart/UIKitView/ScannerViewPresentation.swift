//
//  ScannerViewPresentation.swift
//  worksmart
//
//  Created by Tin Le on 3/7/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import SwiftUI

struct ScannerViewPresentation: UIViewControllerRepresentable {
    func makeUIViewController(
        context: UIViewControllerRepresentableContext
        <ScannerViewPresentation>) -> ScannerViewController {
        return ScannerViewController()
      }
      func updateUIViewController(_ uiViewController: ScannerViewController,
        context: UIViewControllerRepresentableContext
        <ScannerViewPresentation>) {
    }
    
}
