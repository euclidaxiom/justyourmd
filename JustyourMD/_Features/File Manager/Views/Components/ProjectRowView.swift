import SwiftUI

struct ProjectRow: View {
    let project: Project

    var body: some View {
        Label(project.name, systemImage: project.icon)
            .labelStyle(.project)
    }
}
