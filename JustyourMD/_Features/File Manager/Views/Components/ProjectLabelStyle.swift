import SwiftUI

struct ProjectLabelStyle: LabelStyle {

    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .padding(.leading, 1)
        } icon: {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.accentColor.gradient)
                .aspectRatio(1, contentMode: .fill)
                .overlay(alignment: .center) {
                    configuration.icon
                        .foregroundColor(.white)
                        .imageScale(.small)
                        .shadow(
                            color: .black.opacity(0.06), radius: 0.5, y: 0.3)
                }
                .shadow(color: .black.opacity(0.1), radius: 0.5, y: 0.3)
        }
    }
}

extension LabelStyle where Self == ProjectLabelStyle {
    static var project: ProjectLabelStyle { ProjectLabelStyle() }
}
