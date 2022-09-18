//
//  CustomLoadingIndicator.swift
//  TheCoin
//
//  Created by Paras KCD on 2022-09-16.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
            .frame(width: 80, height: 80)
            .background(Color.theme.itemBGColor)
            .cornerRadius(20)
            .shadow(color: Color.theme.itemShadowColor.opacity(0.2), radius: 5, x: 0, y: 7)
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingIndicator()
    }
}
