//
//  AboutScreen.swift
//  iOS_Demo2
//
//  Created by Uri on 7/22/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        WebView(url: "https://www.themoviedb.org/about/our-history")
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
