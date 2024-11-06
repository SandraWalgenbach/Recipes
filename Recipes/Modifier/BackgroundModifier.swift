import Foundation
import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.purple.ignoresSafeArea())
    }
}

extension View {
    func appBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
