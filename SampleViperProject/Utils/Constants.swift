//
//  Constants.swift
//  SampleViperProject
//
//  Created by Rami Ounifi on 1/8/2021.
//

import SwiftUI

let rowSpacing: CGFloat = 10
let  gradientColors:[Color] = [Color("Color01"), Color("Color02")]
var gridLayoutUsers: [GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 1)
}
