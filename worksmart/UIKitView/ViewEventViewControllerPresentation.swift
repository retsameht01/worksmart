//
//  ViewEventViewControllerPresentation.swift
//  worksmart
//
//  Created by Tin Le on 2/28/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import Foundation
import SwiftUI

struct ViewEventViewControllerPresentation: UIViewControllerRepresentable {
    func makeUIViewController(
        context: UIViewControllerRepresentableContext
        <ViewEventViewControllerPresentation>) -> EventsCalendarView {
        return EventsCalendarView()
      }
      func updateUIViewController(_ uiViewController: EventsCalendarView,
        context: UIViewControllerRepresentableContext
        <ViewEventViewControllerPresentation>) {
    }
}
