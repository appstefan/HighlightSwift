import SwiftUI

struct CodeTextCardView: View {
    let style: CardCodeTextStyle
    let color: Color?
    
    var body: some View {
        ZStack {
            if let color {
                RoundedRectangle(cornerRadius: style.cornerRadius, style: style.cornerStyle)
                    .fill(color)
            }
            RoundedRectangle(cornerRadius: style.cornerRadius, style: style.cornerStyle)
                .stroke(AnyShapeStyle(style.stroke), lineWidth: style.lineWidth)
        }
    }
}
