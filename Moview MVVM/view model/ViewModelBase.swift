//
//  ViewModelBase.swift
//  Moview MVVM
//
//  Created by hosam on 10/25/20.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
