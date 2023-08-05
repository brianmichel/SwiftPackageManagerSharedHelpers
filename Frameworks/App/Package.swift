// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private extension String {
    /// The default folder path that should be used for UI specific to macOS.
    static let uiMacOS = "UI_macOS"
    /// The default folder path that should be used for UI specific to Windows.
    static let uiWin = "UI_win"
    /// The default folder path that should be used for resources used in UI specific to Windows.
    static let uiWinResources = "UI_win/Resources"
}

private extension Array {
    /// A helper to return a set of shared elements appends with platform specific ones depending on the platform we're running on.
    ///
    /// A simple example here would be if you were calling this for iOS, you'd end up with an array of elements
    /// that are inclusive of the values passed to `shared` and `iOS`, the end result looking like `[shared + iOS]`.
    ///
    /// - parameter shared: The elements that should be included across all platforms.
    /// - parameter iOS: The elements that should be appended to `shared` if the platform is iOS.
    /// - parameter macOS: The elements that should be appended to `shared` if the platform is macOS.
    /// - parameter windows: The elements that should be appended to `shared` if the platform is Windows.
    static func byPlatform(shared: [Element] = [], iOS: [Element] = [], macOS: [Element] = [], windows: [Element] = []) -> [Element] {
        var final = shared

        #if os(macOS)
        final.append(contentsOf: macOS)
        #elseif os(iOS)
        final.append(contentsOf: iOS)
        #elseif os(Windows)
        final.append(contentsOf: windows)
        #endif

        return final
    }

    /// A helper to only return the passed items if the current platform is either macOS or iOS.
    ///
    /// - parameter items: The items that will be returns if, and only if, the platform is macOS or iOS.
    static func onApple(_ items: [Element]) -> [Element] {
        #if os(macOS) || os(iOS)
        return items
        #else
        return []
        #endif
    }
}

let package = Package(
    name: "App",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "App",
            targets: ["App"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "App",
            dependencies: []),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
        .target(
            name: "CrossPlatform",
            dependencies: [],
            exclude: .onApple([.uiWin])
        )
    ]
)
