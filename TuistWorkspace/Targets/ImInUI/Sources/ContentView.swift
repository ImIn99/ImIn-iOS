import SwiftUI

public struct ContentView: View {
    @State
    var actual: Int = 1
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
    }
    
    public func doThing() -> Int {
        self.actual = 1
        var s :Int = 2
        return s
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
