//
//  ContentView.swift
//  SolarSystemAR
//
//  Created by Viraj Patel on 10/11/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        LaunchContainer()
    }
}

struct LaunchContainer: View {
    @State var showARViewContainer = false
    
    var body: some View {
        VStack {
            Text("What do you want to explore?")
                .bold()
                .font(.title)
                .padding()
            
            Button("Space") {
                print("Start exploring space")
                showARViewContainer.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .fullScreenCover(isPresented: $showARViewContainer) {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
