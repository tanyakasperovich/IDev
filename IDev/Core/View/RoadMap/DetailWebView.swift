//
//  DetailWebView.swift
//  IDev
//
//  Created by Татьяна Касперович on 17.09.23.
//

import SwiftUI

struct DetailWebView: View {
    
    let url: String?
    
    var body: some View {
            WebView(urlString: url)
    }
}

struct DetailWebView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWebView(url: "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics")
    }
}
