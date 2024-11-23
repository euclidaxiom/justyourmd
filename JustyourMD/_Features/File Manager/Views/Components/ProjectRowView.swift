import SwiftUI

struct ProjectRow: View {
    let project: File

    var body: some View {
        Label(project.name, systemImage: "folder.fill")
            .labelStyle(.project)
    }
}
