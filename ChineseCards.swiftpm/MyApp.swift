import SwiftUI

@main
struct MyApp: App {
    @State var page: Int = 0
    
    var body: some Scene {
        WindowGroup {
            switch page {
                case 1:
                    VStack(spacing: 0) {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            TopBar(page: $page)
                        } else {
                            TopBar(page: $page).ignoresSafeArea()
                        }
                        
                        InstructionsView()
                    }
                case 2:
                    VStack(spacing: 0) {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            TopBar(page: $page)
                        } else {
                            TopBar(page: $page).ignoresSafeArea()
                        }
                        LessonOneView().ignoresSafeArea()
                    }
                case 3:
                    VStack(spacing: 0) {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            TopBar(page: $page)
                        } else {
                            TopBar(page: $page).ignoresSafeArea()
                        }
                        LessonTwoView().ignoresSafeArea()
                    }
                case 4:
                    VStack(spacing: 0) {
                        if UIDevice.current.userInterfaceIdiom == .pad {
                            TopBar(page: $page)
                        } else {
                            TopBar(page: $page).ignoresSafeArea()
                        }
                        LessonThreeView().ignoresSafeArea()
                    }
                case 5: ThankYouView(page: $page)
                default: WelcomeView(page: $page)
            }
        }
    }
}
