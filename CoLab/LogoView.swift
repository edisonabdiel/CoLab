import SwiftUI

struct LogoView: View {
    var body: some View {
        Text("CoLab")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
            )
    }
}

#Preview {
    LogoView()
        .preferredColorScheme(.dark)
} 