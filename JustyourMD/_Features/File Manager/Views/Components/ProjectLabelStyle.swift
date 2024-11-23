import SwiftUI

struct ProjectLabelStyle: LabelStyle {

    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .padding(.leading, 1)
        } icon: {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.clear)
                .aspectRatio(1, contentMode: .fill)
                .overlay(alignment: .center) {
                    configuration.icon
                        .foregroundColor(.accentColor)
                }
        }
    }
}

extension LabelStyle where Self == ProjectLabelStyle {
    static var project: ProjectLabelStyle { ProjectLabelStyle() }
}
