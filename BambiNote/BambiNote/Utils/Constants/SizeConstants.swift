//
//  SizeConstants.swift
//  BambiNote
//
//  Created by Heesu Shin on 24/10/2024.
//

import SwiftUI

struct SizeConstants {
    
    static var screenCutoff: CGFloat {
         (UIScreen.main.bounds.width / 2) * 0.8
     }
    static var cardWidth: CGFloat {
         UIScreen.main.bounds.width - 48
     }
    static var cardHeight: CGFloat {
         UIScreen.main.bounds.height / 2
     }
}
