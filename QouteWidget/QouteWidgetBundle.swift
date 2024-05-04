//
//  QouteWidgetBundle.swift
//  QouteWidget
//
//  Created by Ray Nahimi on 16/04/2024.
//

import WidgetKit
import SwiftUI
import FirebaseCore



@main
struct QouteWidgetBundle: WidgetBundle {
    init() {
        FirebaseApp.configure()
    }
    var body: some Widget {
        QouteWidget()
        QouteWidgetLiveActivity()
    }
}
