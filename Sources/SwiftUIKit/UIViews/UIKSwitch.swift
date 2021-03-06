//
//  UIKSwitch.swift
//  SwiftUIKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 9/22/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import UIKit

public struct UIKSwitch: ViewRepresentableHelper {
    public var configuration = { (view: UISwitch) in }

    public init(configuration: @escaping (UIViewType) -> () = { _ in }) {
        self.configuration = configuration
    }
}
