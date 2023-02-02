//
//  ProgressLoader.swift
//  DashboardV2Pro
//
//  Created by Guru Mahan on 17/01/23.
//



import SwiftUI

struct ProgressLoader: ViewModifier {
    @Binding var isShowing: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
                .disabled(self.isShowing)
            
            VStack {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .frame(width: 100, height: 100)
            .background(Color.black.opacity(0.3))
            .foregroundColor(Color.primary)
            .cornerRadius(20)
            .opacity(self.isShowing ? 1 : 0)
            
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let loader = UIActivityIndicatorView(style: style)
        loader.color = UIColor.white
        return loader
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

extension View {
    func loader(isShown: Binding<Bool>) -> some View {
        modifier(ProgressLoader(isShowing: isShown))
    }
}
