import SwiftUI

struct AppIconView: View {
    var body: some View {
        ZStack {
            // Solid background instead of gradient for cleaner look
            Color.black
            
            // Icon content - hands forming heart
            HandsView()
                .frame(width: 100, height: 100)
                .scaleEffect(0.8) // Adjust size to fit better
        }
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

struct HandsView: View {
    var body: some View {
        Path { path in
            // Left hand - long curved line
            path.move(to: CGPoint(x: 20, y: 30))
            path.addCurve(
                to: CGPoint(x: 50, y: 70),
                control1: CGPoint(x: 25, y: 45),
                control2: CGPoint(x: 45, y: 65)
            )
            
            // Right hand - long curved line
            path.move(to: CGPoint(x: 80, y: 30))
            path.addCurve(
                to: CGPoint(x: 50, y: 70),
                control1: CGPoint(x: 75, y: 45),
                control2: CGPoint(x: 55, y: 65)
            )
            
            // Heart shape in the middle
            let heartSize: CGFloat = 15
            let heartX: CGFloat = 50 - (heartSize/2)
            let heartY: CGFloat = 55
            
            // Left half of heart
            path.move(to: CGPoint(x: heartX, y: heartY))
            path.addCurve(
                to: CGPoint(x: heartX + (heartSize/2), y: heartY + heartSize),
                control1: CGPoint(x: heartX, y: heartY + (heartSize/3)),
                control2: CGPoint(x: heartX + (heartSize/3), y: heartY + heartSize)
            )
            
            // Right half of heart
            path.move(to: CGPoint(x: heartX + heartSize, y: heartY))
            path.addCurve(
                to: CGPoint(x: heartX + (heartSize/2), y: heartY + heartSize),
                control1: CGPoint(x: heartX + heartSize, y: heartY + (heartSize/3)),
                control2: CGPoint(x: heartX + (2*heartSize/3), y: heartY + heartSize)
            )
        }
        .stroke(Color.white, lineWidth: 2.5)
        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
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