public struct App {
    public private(set) var text = "Hello, World!"

    public init() {
        print("From App Package: \(text)")
    }
}
