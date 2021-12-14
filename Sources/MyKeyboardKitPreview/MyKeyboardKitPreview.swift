import SwiftUI
import KeyboardKit

private class FakeMockDevice: UIDevice {
    override var userInterfaceIdiom: UIUserInterfaceIdiom { .phone }
}

struct KeyboardPreviewCard_Previews: PreviewProvider {
   private static let ctx = KeyboardContext.preview
   static func input(for locale: KeyboardLocale) -> KeyboardInputSetProvider {
       StandardKeyboardInputSetProvider(
           context: ctx,
           providers: [provider(for: locale)])
   }
   static func layout(for locale: KeyboardLocale) -> KeyboardLayoutProvider {
       iPhoneKeyboardLayoutProvider(inputSetProvider: input(for: locale))
   }
   
   static func provider(for locale: KeyboardLocale) -> LocalizedKeyboardInputSetProvider {
       switch locale {
//        case .swedish: return InternalSwedishKeyboardInputSetProvider(device: MockDevice())
       default: return EnglishKeyboardInputSetProvider(device: FakeMockDevice())
       }
   }
   
   static var previews: some View {
       Group {
           // A standard system keyboard
           SystemKeyboard(
               layout: .preview,
               appearance: PreviewKeyboardAppearance.preview,
               actionHandler: PreviewKeyboardActionHandler.preview,
               context: .preview,
               inputContext: nil,
               secondaryInputContext: nil,
               width: UIScreen.main.bounds.width)
       }
   }
}
