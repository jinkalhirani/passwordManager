import SwiftUI

//MARK: - TextField_Modifier -
struct MyTextFieldModifier: ViewModifier {
    
    let placeString: String
    let fieldName: String
    func body(content: Content) -> some View {
        content
            .placeholder(when: fieldName.isEmpty) {
                Text(placeString).foregroundColor(Color(hex: "#CCCCCC"))
            }
            .foregroundColor(.black)
            .disableAutocorrection(true)
            .padding(.all)
            .frame(height: 44)
            
    }
}

//MARK: - Placeholder Color -
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension VStack {
    func myVStackModifier() -> some View {
        self
            .background(.white)
            .border(Color(hex: "#CBCBCB"))
            .cornerRadius(4)
   }
}

struct ScreenSize {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}

//MARK: - Image -
extension Image {
    func myLeftImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.leading, 20)
            .frame(width: 20, height: 20)
   }
    
    func myRightImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.trailing, 20)
            .frame(width: 20, height: 20)
   }
}
