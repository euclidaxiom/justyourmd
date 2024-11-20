import SwiftUI

struct ContentView: View {
    @StateObject private var fileManagerViewModel = MockFileManagerViewModel()
    
    var body: some View {
        NavigationSplitView {
            Group {
                FileManagerView(viewModel: fileManagerViewModel)
            }
            .navigationSplitViewColumnWidth(min: 224, ideal: 224)
        } detail: {
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 896, minHeight: 448)
}
