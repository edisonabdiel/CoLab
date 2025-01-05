import SwiftUI

struct ExportAppIcon: View {
    let sizes: [(String, CGFloat)] = [
        ("iPhone", 60),
        ("iPad", 76),
        ("iPad Pro", 83.5),
        ("App Store", 1024)
    ]
    
    var body: some View {
        VStack {
            ForEach(sizes, id: \.0) { name, size in
                VStack {
                    Text("\(name) - \(Int(size))pt")
                    AppIconView()
                        .frame(width: size, height: size)
                }
            }
        }
        .padding()
    }
} 
