import SwiftUI

struct IconSet {
    // Tab Bar Icons
    struct TabBar {
        @ViewBuilder
        static func matchIcon() -> some View {
            Label("Match", systemImage: "person.2.fill")
                .symbolRenderingMode(.hierarchical)
        }
        
        @ViewBuilder
        static func profileIcon() -> some View {
            Label("Profile", systemImage: "person.circle.fill")
                .symbolRenderingMode(.hierarchical)
        }
        
        @ViewBuilder
        static func settingsIcon() -> some View {
            Label("Settings", systemImage: "gearshape.fill")
                .symbolRenderingMode(.hierarchical)
        }
    }
    
    // App Logo Variations
    struct Logo {
        @ViewBuilder
        static func standard() -> some View {
            let _ = print("Loading CoLabIcon in standard size")
            Image("CoLabIcon", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .onAppear {
                    print("CoLabIcon view appeared in standard size")
                }
        }
        
        @ViewBuilder
        static func small() -> some View {
            let _ = print("Loading CoLabIcon in small size")
            Image("CoLabIcon", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .onAppear {
                    print("CoLabIcon view appeared in small size")
                }
        }
        
        @ViewBuilder
        static func large() -> some View {
            let _ = print("Loading CoLabIcon in large size")
            Image("CoLabIcon", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .onAppear {
                    print("CoLabIcon view appeared in large size")
                }
        }
    }
}

// Add preview
#Preview {
    VStack(spacing: 20) {
        IconSet.Logo.large()
        IconSet.Logo.standard()
        IconSet.Logo.small()
        
        HStack(spacing: 20) {
            IconSet.TabBar.matchIcon()
            IconSet.TabBar.profileIcon()
            IconSet.TabBar.settingsIcon()
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}
