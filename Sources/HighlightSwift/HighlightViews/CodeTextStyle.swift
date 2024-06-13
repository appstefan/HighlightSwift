import SwiftUI

public protocol CodeTextStyle {
    var verticalPadding: CGFloat { get }
    var horizontalPadding: CGFloat { get }
}

//  MARK: - Plain

public struct PlainCodeTextStyle: CodeTextStyle {
    public init() { }
    
    public let verticalPadding: CGFloat = 0
    public let horizontalPadding: CGFloat = 0
}

extension CodeTextStyle where Self == CardCodeTextStyle {
    
    /// The default code text style with no decoration.
    public static var plain: PlainCodeTextStyle {
        PlainCodeTextStyle()
    }
}

//  MARK: - Card

public struct CardCodeTextStyle: CodeTextStyle {
    let cornerRadius: CGFloat
    let cornerStyle: RoundedCornerStyle
    let stroke: AnyShapeStyle
    let lineWidth: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat
    
    public init(
        cornerRadius: CGFloat = 8,
        cornerStyle: RoundedCornerStyle = .continuous,
        stroke: AnyShapeStyle = CardCodeTextStyle.defaultStroke,
        lineWidth: CGFloat = 0.5,
        verticalPadding: CGFloat = 8,
        horizontalPadding: CGFloat = 10
    ) {
        self.cornerRadius = cornerRadius
        self.cornerStyle = cornerStyle
        self.stroke = stroke
        self.lineWidth = lineWidth
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    public static var defaultStroke: AnyShapeStyle {
        if #available(iOS 17.0, *) {
            AnyShapeStyle(.separator)
        } else {
            AnyShapeStyle(.gray.opacity(0.5))
        }
    }
}

extension CodeTextStyle where Self == CardCodeTextStyle {
    
    /// A code text style with a color-themed rounded background and a border.
    public static var card: CardCodeTextStyle {
        CardCodeTextStyle()
    }
    
    /// A code text style with a color-themed rounded background and a border.
    public static func card(
        cornerRadius: CGFloat = 8,
        cornerStyle: RoundedCornerStyle = .continuous,
        stroke: AnyShapeStyle = CardCodeTextStyle.defaultStroke,
        lineWidth: CGFloat = 1,
        verticalPadding: CGFloat = 8,
        horizontalPadding: CGFloat = 10
    ) -> CardCodeTextStyle {
        CardCodeTextStyle(
            cornerRadius: cornerRadius,
            cornerStyle: cornerStyle,
            stroke: stroke,
            lineWidth: lineWidth,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}
