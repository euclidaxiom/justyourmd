import SwiftUI

struct PageRow: View {
    let page: File

    var body: some View {
        HStack {
            Label(page.name, systemImage: pageIcon)
                .tint(pageColor)
            Spacer()
            if page.fileStatus == .local {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var pageIcon: String {
        switch page.fileStatus {
        case .online, .local:
            return "text.page.fill"
        case .draft:
            return "text.page"
        }
    }
    
    private var pageColor: Color {
        switch page.fileStatus {
        case .online, .local:
            return .accentColor
        case .draft:
            return .secondary
        }
    }
}
