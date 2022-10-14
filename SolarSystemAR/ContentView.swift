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
        let arView = ARView(frame: .infinite) //was zero before
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchorTwo = try! Experience.loadBox()
        
        if let boxAnchor = try? Experience.loadBox() {
            /*let sunInfoAction = boxAnchor.actions.allActions.filter({$0.identifier == "cubeTap"}).first
            
            sunInfoAction?.onAction = { entity in
                self.textTouch(name: entity.name)
            }*/
            
            // Add the box anchor to the scene
            arView.scene.anchors.append(boxAnchor)
            
            //load all of the planets
            if let sun = boxAnchor.findEntity(named: "Sun") {
                print("\(sun.name) Loaded")
            }
            
            if let mercury = boxAnchor.findEntity(named: "Mercury") {
                print("\(mercury.name) Loaded")
            }
            
            if let venus = boxAnchor.findEntity(named: "Venus") {
                print("\(venus.name) Loaded")
            }
            
            if let earth = boxAnchor.findEntity(named: "Earth") {
                print("\(earth.name) Loaded")
            }
            
            if let mars = boxAnchor.findEntity(named: "Mars") {
                print("\(mars.name) Loaded")
            }
            
            if let jupiter = boxAnchor.findEntity(named: "Jupiter") {
                print("\(jupiter.name) Loaded")
            }
            
            if let saturn = boxAnchor.findEntity(named: "Saturn") {
                print("\(saturn.name) Loaded")
            }
            
            if let uranus = boxAnchor.findEntity(named: "Uranus") {
                print("\(uranus.name) Loaded")
            }
            
            if let neptune = boxAnchor.findEntity(named: "Neptune") {
                print("\(neptune.name) Loaded")
            }
        }
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func textTouch(name: String)  {
        print("\(name) clicked")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
