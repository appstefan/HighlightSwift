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

extension CodeTextStyle where Self == PlainCodeTextStyle {
    
    /// The default code text style with no decoration.
    public static var plain: PlainCodeTextStyle {
        PlainCodeTextStyle()
    }
}

//  MARK: - Card

public struct CardCodeTextStyle: CodeTextStyle {
    public let cornerRadius: CGFloat
    public let cornerStyle: RoundedCornerStyle
    public let stroke: AnyShapeStyle
    public let lineWidth: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat
}

extension CodeTextStyle where Self == CardCodeTextStyle {

    /// A code text style with the theme background color and a border.
    public static var card: CardCodeTextStyle {
        CardCodeTextStyle(
            cornerRadius: 10,
            cornerStyle: .continuous,
            stroke: defaultStroke,
            lineWidth: 0.333,
            verticalPadding: 8,
            horizontalPadding: 12
        )
    }
    
    /// A code text style with the theme background color and a border.
    public static func card<S: ShapeStyle>(
        cornerRadius: CGFloat = 10,
        cornerStyle: RoundedCornerStyle = .continuous,
        stroke: S = CardCodeTextStyle.defaultStroke,
        lineWidth: CGFloat = 0.333,
        verticalPadding: CGFloat = 8,
        horizontalPadding: CGFloat = 12
    ) -> CardCodeTextStyle {
        CardCodeTextStyle(
            cornerRadius: cornerRadius,
            cornerStyle: cornerStyle,
            stroke: AnyShapeStyle(stroke),
            lineWidth: lineWidth,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
    
    public static var defaultStroke: AnyShapeStyle {
        if #available(iOS 17.0, *) {
            AnyShapeStyle(.separator)
        } else {
            AnyShapeStyle(.secondary.opacity(0.5))
        }
    }
}
