//
//  LottieButtonView.swift
//  LottieAnimationsPlusSlideInMenu
//
//  Created by Artyom Mihailovich on 20.07.2020.
//  Copyright © 2020 Artyom Mihailovich. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieButton: UIViewRepresentable {
    
    typealias UIViewType = UIView
    let animationView = AnimatedSwitch()
    let filename: String
    let action: () -> Void

    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
        let view = UIView()
        
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed =  2
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        
        animationView.isOn = false
        animationView.setProgressForState(fromProgress: 0, toProgress: 0.35, forOnState: true)
        animationView.setProgressForState(fromProgress: 0.35, toProgress: 0, forOnState: false)
                
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieButton>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        let parent: LottieButton
        
        init(_ parent: LottieButton) {
            self.parent = parent
            super.init()
            parent.animationView.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }
        
        // this function can be called anything, but it is best to make the names clear
        @objc func touchUpInside() {
            parent.action()
        }
    }
}

struct SwitchAnimationLottie_Previews: PreviewProvider {
    static var previews: some View {
        LottieButton(filename: "BurgerMenu", action: {
        })
    }
}
