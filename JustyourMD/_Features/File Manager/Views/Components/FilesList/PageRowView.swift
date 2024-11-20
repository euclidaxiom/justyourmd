import SwiftUI

struct PageRow: View {
    let page: File

    var body: some View {
        HStack {
            Label(page.name, systemImage: "document.fill")
            Spacer()
            if page.gitStatus != .unmodified {
                Image(systemName: gitStatusIcon)
                    .foregroundColor(gitStatusColor)
            }
        }
    }

    private var gitStatusIcon: String {
        switch page.gitStatus {
        case .unmodified: return ""
        case .modified: return "circle.fill"
        case .staged: return "circle.fill"
        case .untracked: return "questionmark.circle.fill"
        }
    }

    private var gitStatusColor: Color {
        switch page.gitStatus {
        case .unmodified: return .clear
        case .modified: return .yellow
        case .staged: return .blue
        case .untracked: return .gray
        }
    }
}
