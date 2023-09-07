//
//  BackgroundView.swift
//  IDev
//
//  Created by Татьяна Касперович on 6.09.23.
//

import SwiftUI

struct BackgroundView: View {
    var color: Color
    var body: some View {
        ZStack {
            color
                .opacity(0.05)
                .ignoresSafeArea()

            let rows = [GridItem(), GridItem(), GridItem(),  GridItem(),  GridItem(), GridItem(),  GridItem(), GridItem(),  GridItem()]
            LazyHGrid(rows: rows) {
                            ForEach(0...100, id: \.self) { value in
                                Image(systemName: "swift")
                                    .opacity(0.4)
                                Text(" ")
                            }
                            .foregroundColor(color)
                            .opacity(0.4)
                        }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(color: .accentColor)
    }
}
