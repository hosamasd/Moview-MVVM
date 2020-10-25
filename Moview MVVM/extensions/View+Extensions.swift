//
//  View+Extensions.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
