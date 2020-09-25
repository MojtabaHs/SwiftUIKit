//
//  UIKTextField.swift
//  SwiftUIKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 9/22/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import SwiftUI

public struct UIKTextField: ViewRepresentableHelper {
    public typealias ViewType = UITextField

    @Binding public var text: String

    public var configuration = { (view: ViewType) in }

    public init(text: Binding<String>, configuration: @escaping (ViewType) -> () = { _ in }) {
        self.configuration = configuration
        self._text = text
    }

    public func makeUIView(context: Context) -> ViewType {
        let view = makeView(context)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.delegate = context.coordinator
        view.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
        return view
    }

    public func updateUIView(_ uiView: ViewType, context: Context) {
        updateView(uiView, context)
        uiView.text = text
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }

        @objc public func textFieldDidChange(_ textView: UITextField) {
            self.text.wrappedValue = textView.text ?? ""
        }
    }
}
