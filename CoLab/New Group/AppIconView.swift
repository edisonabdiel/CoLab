import SwiftUI

struct AppIconView: View {
    var body: some View {
        ZStack {
            // Background
            BrandKit.gradient
            
            // Icon content - hands forming heart
            HandsView()
                .frame(width: 100, height: 100)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
        )
    }
}

struct HandsView: View {
    var body: some View {
        Path { path in
            // Left hand
            path.move(to: CGPoint(x: 35, y: 45))
            path.addCurve(
                to: CGPoint(x: 50, y: 65),
                control1: CGPoint(x: 40, y: 50),
                control2: CGPoint(x: 45, y: 60)
            )
            
            // Right hand
            path.move(to: CGPoint(x: 65, y: 45))
            path.addCurve(
                to: CGPoint(x: 50, y: 65),
                control1: CGPoint(x: 60, y: 50),
                control2: CGPoint(x: 55, y: 60)
            )
        }
        .stroke(Color.white, lineWidth: 4)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 2)
    }
}

#Preview {
    VStack(spacing: 20) {
        AppIconView()
            .frame(width: 120, height: 120)
        AppIconView()
            .frame(width: 60, height: 60)
        AppIconView()
            .frame(width: 30, height: 30)
    }
    .padding()
    .preferredColorScheme(.dark)
} 
