import SwiftUI

// Portfolio item placeholder
struct PortfolioItem: View {
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(
                    colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.5)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .aspectRatio(1, contentMode: .fill)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    VStack {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            ForEach(0..<6) { _ in
                PortfolioItem()
            }
        }
        .padding()
    }
    .preferredColorScheme(.dark)
} 