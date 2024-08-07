//
//  ScreenOne.swift
//  Cuppfee
//
//  Created by The Seven Stallions on 29/06/22.
//

import SwiftUI
import iPhoneNumberField
import WebKit


struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}

struct ScreenOne: View {
    
    @State var text = ""
    
    var body: some View {
        
        GifImage("coffee-loading")
                        .frame(width: 50, height: 50)
                        
        
    }
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne()
            .background(Color.black)
    }
}
