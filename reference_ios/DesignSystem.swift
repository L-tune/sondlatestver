import SwiftUI
import UIKit

// MARK: - Design System для Memento
// Адаптивная дизайн-система для светлой и тёмной темы с графитовой палитрой

struct DesignSystem {

    // MARK: - Colors
    struct Colors {
        // MARK: - Adaptive Background Colors (Light/Dark mode)

        /// Основной фон приложения
        /// Light: тёплый off-white (#FAF9F5), Dark: графитовый (#1C1C1E)
        static func warmBackground(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "1C1C1E") ?? Color(UIColor.systemBackground))
                : (Color(hex: "FAF9F5") ?? Color(UIColor.systemBackground))
        }

        /// Вторичный фон для секций
        /// Light: #F7F7FC, Dark: #2C2C2E
        static func secondaryBackground(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "2C2C2E") ?? Color(UIColor.secondarySystemBackground))
                : (Color(hex: "F7F7FC") ?? Color(UIColor.secondarySystemBackground))
        }

        /// Фон карточек
        /// Light: white 70%, Dark: #3A3A3C
        static func cardBackground(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "3A3A3C") ?? Color(UIColor.tertiarySystemBackground))
                : Color.white.opacity(0.7)
        }

        // MARK: - Adaptive Text Colors

        /// Основной текст
        /// Light: тёмный (#262633), Dark: светлый (#F5F5F7)
        static func primaryText(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "F5F5F7") ?? Color(UIColor.label))
                : (Color(hex: "262633") ?? Color(UIColor.label))
        }

        /// Вторичный текст
        /// Light: #73738C, Dark: #A1A1A6
        static func secondaryText(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "A1A1A6") ?? Color(UIColor.secondaryLabel))
                : (Color(hex: "73738C") ?? Color(UIColor.secondaryLabel))
        }

        /// Третичный текст
        /// Light: #A6A6B3, Dark: #636366
        static func tertiaryText(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "636366") ?? Color(UIColor.tertiaryLabel))
                : (Color(hex: "A6A6B3") ?? Color(UIColor.tertiaryLabel))
        }

        // MARK: - Adaptive Accent Colors

        /// Accent синий (адаптируется для контраста)
        /// Light: #4A90FF, Dark: #64B5F6 (светлее для тёмного фона)
        static func preciseBlue(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "64B5F6") ?? Color.blue)
                : (Color(hex: "4A90FF") ?? Color.blue)
        }

        /// Recording красный (адаптируется для контраста)
        /// Light: #FF4757, Dark: #FF6B7A (светлее для тёмного фона)
        static func preciseRed(for scheme: ColorScheme) -> Color {
            scheme == .dark
                ? (Color(hex: "FF6B7A") ?? Color.red)
                : (Color(hex: "FF4757") ?? Color.red)
        }

        // MARK: - Static Colors (Legacy compatibility)
        // Используются когда colorScheme недоступен через Environment

        /// Warm off-white background color for app-wide consistency
        /// Dynamic: Light #FAF9F5, Dark #1C1C1E
        static let warmBackground = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)  // #1C1C1E
                : UIColor(red: 0.98, green: 0.976, blue: 0.96, alpha: 1) // #FAF9F5
        })

        /// Glassmorphism background gradient — dark-mode aware
        static var primaryBackground: LinearGradient {
            let isDark = UITraitCollection.current.userInterfaceStyle == .dark
            return isDark
                ? LinearGradient(
                    colors: [
                        Color(red: 0.11, green: 0.11, blue: 0.14), // #1C1C24
                        Color(red: 0.13, green: 0.12, blue: 0.14), // #211F24
                        Color(red: 0.12, green: 0.11, blue: 0.15)  // #1E1C26
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                : LinearGradient(
                    colors: [
                        Color(red: 0.94, green: 0.95, blue: 0.98), // #F0F2FA
                        Color(red: 0.98, green: 0.96, blue: 0.98), // #FAF5FA
                        Color(red: 0.96, green: 0.94, blue: 0.99)  // #F5F0FC
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
        }

        /// Dynamic: Light #F7F7FC, Dark #2C2C2E
        static let secondaryBackground = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1)  // #2C2C2E
                : UIColor(red: 0.97, green: 0.97, blue: 0.99, alpha: 1)  // #F7F7FC
        })
        /// Dynamic: Light white 70%, Dark #3A3A3C
        static let cardBackground = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1)  // #3A3A3C
                : UIColor(white: 1.0, alpha: 0.7)
        })

        // Glass morphism colors — reduced opacity in dark mode
        static let glassWhite = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(white: 1.0, alpha: 0.08)
                : UIColor(white: 1.0, alpha: 0.25)
        })
        static let glassLight = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(white: 1.0, alpha: 0.05)
                : UIColor(white: 1.0, alpha: 0.15)
        })
        static let glassBorder = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(white: 1.0, alpha: 0.12)
                : UIColor(white: 1.0, alpha: 0.3)
        })

        // Precise blue and red — slightly brighter in dark mode for contrast
        /// Dynamic: Light #4A90FF, Dark #64B5F6
        static let preciseBlue = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.39, green: 0.71, blue: 0.96, alpha: 1)  // #64B5F6
                : UIColor(red: 0.29, green: 0.56, blue: 1.0, alpha: 1)   // #4A90FF
        })
        /// Dynamic: Light #99CCFF, Dark #90CAF9
        static let softBlue = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.56, green: 0.79, blue: 0.98, alpha: 1)  // #90CAF9
                : UIColor(red: 0.60, green: 0.80, blue: 1.0, alpha: 1)   // #99CCFF
        })
        /// Dynamic: Light #FF4757, Dark #FF6B7A
        static let preciseRed = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 1.0, green: 0.42, blue: 0.48, alpha: 1)   // #FF6B7A
                : UIColor(red: 1.0, green: 0.28, blue: 0.34, alpha: 1)   // #FF4757
        })
        /// Dynamic: Light #FFA6B3, Dark #FFB4BC
        static let softRed = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 1.0, green: 0.71, blue: 0.74, alpha: 1)   // #FFB4BC
                : UIColor(red: 1.0, green: 0.65, blue: 0.70, alpha: 1)   // #FFA6B3
        })

        // Keep one mint accent for variety
        /// Dynamic: Light #99E6D1, Dark #80CBC4
        static let mintAccent = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.50, green: 0.80, blue: 0.77, alpha: 1)  // #80CBC4
                : UIColor(red: 0.60, green: 0.90, blue: 0.82, alpha: 1)  // #99E6D1
        })

        // Main gradients with precise blue and red
        static let primaryGradient = LinearGradient(
            colors: [softBlue, preciseBlue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        static let accentGradient = LinearGradient(
            colors: [preciseBlue, mintAccent],
            startPoint: .leading,
            endPoint: .trailing
        )

        static let recordingGradient = LinearGradient(
            colors: [preciseRed, softRed, softBlue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        // Legacy colors for compatibility
        static let accent = preciseBlue
        static let accentLight = preciseBlue.opacity(0.2)
        static let recording = preciseRed

        // Text colors — dynamic for light/dark mode
        /// Dynamic: Light #262633, Dark #F5F5F7
        static let primaryText = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1)  // #F5F5F7
                : UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)  // #262633
        })
        /// Dynamic: Light #73738C, Dark #A1A1A6
        static let secondaryText = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.63, green: 0.63, blue: 0.65, alpha: 1)  // #A1A1A6
                : UIColor(red: 0.45, green: 0.45, blue: 0.55, alpha: 1)  // #73738C
        })
        /// Dynamic: Light #A6A6B3, Dark #636366
        static let tertiaryText = Color(UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.39, green: 0.39, blue: 0.40, alpha: 1)  // #636366
                : UIColor(red: 0.65, green: 0.65, blue: 0.70, alpha: 1)  // #A6A6B3
        })
        static let glassText = Color.white.opacity(0.9)

    }
    
    // MARK: - Typography
    struct Typography {
        // System typography for reliability
        static let displayLarge = Font.system(size: 52, weight: .ultraLight, design: .default)
        static let displayMedium = Font.system(size: 34, weight: .thin, design: .default)
        static let titleLarge = Font.system(size: 28, weight: .light, design: .default)
        static let titleMedium = Font.system(size: 22, weight: .regular, design: .default)
        static let bodyLarge = Font.system(size: 18, weight: .regular, design: .default)
        static let bodyMedium = Font.system(size: 16, weight: .regular, design: .default)
        static let caption = Font.system(size: 14, weight: .medium, design: .default)
            
        // Fallback system fonts
        static let displayLargeFallback = Font.system(size: 52, weight: .ultraLight, design: .default)
        static let displayMediumFallback = Font.system(size: 34, weight: .thin, design: .default)
        static let titleLargeFallback = Font.system(size: 28, weight: .light, design: .default)
        static let titleMediumFallback = Font.system(size: 22, weight: .regular, design: .default)
        static let bodyLargeFallback = Font.system(size: 18, weight: .regular, design: .default)
        static let bodyMediumFallback = Font.system(size: 16, weight: .regular, design: .default)
        
        // Special glass effects typography
        static let glassTitle = Font.system(size: 24, weight: .ultraLight, design: .default)
        static let glassBody = Font.system(size: 16, weight: .light, design: .default)
        
        // Elegant monospaced for timers
        static let timerFont = Font.system(size: 42, weight: .ultraLight, design: .monospaced)
        static let durationFont = Font.system(size: 16, weight: .light, design: .monospaced)
        
        // MARK: - Text Module Typography (Notion-style)
        // Using system fonts for clean, readable text presentation
        static let textTitle = Font.system(size: 24, weight: .bold, design: .default)
        static let textSectionHeader = Font.system(size: 18, weight: .medium, design: .default)
        static let textBody = Font.system(size: 16, weight: .regular, design: .default)
        static let textTranscript = Font.system(size: 15, weight: .regular, design: .default)
        static let textCaption = Font.system(size: 14, weight: .medium, design: .default)
        
        // Aliases for cleaner code
        static var safeTextTitle: Font { textTitle }
        static var safeTextSectionHeader: Font { textSectionHeader }
        static var safeTextBody: Font { textBody }
        static var safeTextTranscript: Font { textTranscript }
        static var safeTextCaption: Font { textCaption }
    }
    
    // MARK: - Spacing
    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 48
        static let xxxl: CGFloat = 64
        
        // MARK: - Text Module Spacing (Swiss Grid System)
        // Modular spacing based on 16pt base unit
        static let textBaseUnit: CGFloat = 16
        static let textBlockSpacing: CGFloat = 24     // Between major sections
        static let textParagraphSpacing: CGFloat = 16 // Between paragraphs  
        static let textLineSpacing: CGFloat = 4       // Between lines
        static let textHorizontalMargin: CGFloat = 20 // Left/right margins
        static let textVerticalMargin: CGFloat = 24   // Top/bottom margins
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let extraLarge: CGFloat = 32
        static let circle: CGFloat = 50
    }
    
    // MARK: - Shadows
    struct Shadows {
        static let soft = Color.black.opacity(0.04)
        static let medium = Color.black.opacity(0.08)
        static let card = Color.black.opacity(0.06)
    }

    // MARK: - UIColors (for UIKit components like UITextView)
    struct UIColors {
        static let primaryText = UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1)
                : UIColor(red: 0.15, green: 0.15, blue: 0.20, alpha: 1)
        }
        static let secondaryText = UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.63, green: 0.63, blue: 0.65, alpha: 1)
                : UIColor(red: 0.45, green: 0.45, blue: 0.55, alpha: 1)
        }
        static let tertiaryText = UIColor { tc in
            tc.userInterfaceStyle == .dark
                ? UIColor(red: 0.39, green: 0.39, blue: 0.40, alpha: 1)
                : UIColor(red: 0.65, green: 0.65, blue: 0.70, alpha: 1)
        }
    }
}

// MARK: - View Extensions for glassmorphism design
extension View {
    // Clean card effect
    func glassCardStyle() -> some View {
        self
            .background(Color(UIColor.secondarySystemBackground), in: RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.large))
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
    
    // Enhanced glassmorphism with inner glow
    func premiumGlassStyle() -> some View {
        self
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(DesignSystem.CornerRadius.large)
            .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
    
    // Legacy card style for compatibility
    func cardStyle() -> some View {
        glassCardStyle()
    }
    
    // Lightweight card style for lists - minimal effects for performance
    func lightCardStyle() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.large)
                    .fill(Color(UIColor.secondarySystemBackground))
            )
            .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
    
    // Glass press effect
    func glassPress(isPressed: Bool = false) -> some View {
        self
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isPressed ? 0.8 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isPressed)
    }
    
    // Мягкий press эффект (legacy)
    func softPress(isPressed: Bool = false) -> some View {
        glassPress(isPressed: isPressed)
    }
    
    // Glassmorphism background with gradients — dark-mode aware
    func glassBackground() -> some View {
        let isDark = UITraitCollection.current.userInterfaceStyle == .dark
        let orbOpacity = isDark ? 0.15 : 1.0  // Reduce orb brightness in dark mode

        return self
            .background(
                ZStack {
                    // Primary gradient background
                    Rectangle()
                        .fill(DesignSystem.Colors.primaryBackground)

                    // Floating glow orbs (dimmed in dark mode)
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    DesignSystem.Colors.preciseBlue.opacity(0.3 * orbOpacity),
                                    DesignSystem.Colors.preciseBlue.opacity(0.1 * orbOpacity),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 200
                            )
                        )
                        .frame(width: 300, height: 300)
                        .offset(x: -100, y: -150)
                        .blur(radius: 30)

                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    DesignSystem.Colors.softRed.opacity(0.25 * orbOpacity),
                                    DesignSystem.Colors.softRed.opacity(0.08 * orbOpacity),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 150
                            )
                        )
                        .frame(width: 250, height: 250)
                        .offset(x: 120, y: 200)
                        .blur(radius: 25)

                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    DesignSystem.Colors.mintAccent.opacity(0.2 * orbOpacity),
                                    DesignSystem.Colors.mintAccent.opacity(0.05 * orbOpacity),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 120
                            )
                        )
                        .frame(width: 180, height: 180)
                        .offset(x: 80, y: -100)
                        .blur(radius: 20)

                    // Subtle noise texture (inverted for dark mode)
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: isDark
                                    ? [
                                        Color.white.opacity(0.01),
                                        Color.clear,
                                        Color.white.opacity(0.005)
                                      ]
                                    : [
                                        Color.white.opacity(0.02),
                                        Color.clear,
                                        Color.black.opacity(0.01)
                                      ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .blendMode(.overlay)
                }
            )
    }
    
    // Legacy grain background (redirects to glass)
    func grainBackground() -> some View {
        glassBackground()
    }
    
}

// MARK: - Text Module Components (Notion-style)

/// Swiss grid-based text block component
struct TextBlock: View {
    let content: String
    let style: TextBlockStyle
    
    enum TextBlockStyle {
        case title
        case sectionHeader  
        case body
        case transcript
        case caption
    }
    
    var body: some View {
        Text(content)
            .font(fontForStyle)
            .foregroundColor(colorForStyle)
            .lineSpacing(DesignSystem.Spacing.textLineSpacing)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, DesignSystem.Spacing.textHorizontalMargin)
            .padding(.bottom, paddingForStyle)
    }
    
    private var fontForStyle: Font {
        switch style {
        case .title: return DesignSystem.Typography.safeTextTitle
        case .sectionHeader: return DesignSystem.Typography.safeTextSectionHeader
        case .body: return DesignSystem.Typography.safeTextBody
        case .transcript: return DesignSystem.Typography.safeTextTranscript
        case .caption: return DesignSystem.Typography.safeTextCaption
        }
    }
    
    private var colorForStyle: Color {
        switch style {
        case .title: return DesignSystem.Colors.primaryText
        case .sectionHeader: return DesignSystem.Colors.primaryText
        case .body: return DesignSystem.Colors.primaryText
        case .transcript: return DesignSystem.Colors.secondaryText
        case .caption: return DesignSystem.Colors.tertiaryText
        }
    }
    
    private var paddingForStyle: CGFloat {
        switch style {
        case .title: return DesignSystem.Spacing.textBlockSpacing
        case .sectionHeader: return DesignSystem.Spacing.textParagraphSpacing
        case .body: return DesignSystem.Spacing.textParagraphSpacing
        case .transcript: return DesignSystem.Spacing.textLineSpacing
        case .caption: return DesignSystem.Spacing.textLineSpacing
        }
    }
}

/// Search result highlighting component
struct SearchHighlight: View {
    let text: String
    let searchTerm: String
    let font: Font
    let primaryColor: Color
    let highlightColor: Color
    
    init(text: String, searchTerm: String, 
         font: Font = DesignSystem.Typography.safeTextBody,
         primaryColor: Color = DesignSystem.Colors.primaryText,
         highlightColor: Color = DesignSystem.Colors.accent.opacity(0.3)) {
        self.text = text
        self.searchTerm = searchTerm
        self.font = font
        self.primaryColor = primaryColor
        self.highlightColor = highlightColor
    }
    
    var body: some View {
        Text(createHighlightedAttributedString())
            .font(font)
    }
    
    private func createHighlightedAttributedString() -> AttributedString {
        var attributedString = AttributedString(text)
        attributedString.foregroundColor = primaryColor
        
        if !searchTerm.isEmpty {
            let searchText = searchTerm.lowercased()
            let fullText = text.lowercased()
            var searchRange = fullText.startIndex
            
            while let range = fullText.range(of: searchText, range: searchRange..<fullText.endIndex) {
                let startIndex = attributedString.index(attributedString.startIndex, offsetByCharacters: fullText.distance(from: fullText.startIndex, to: range.lowerBound))
                let endIndex = attributedString.index(startIndex, offsetByCharacters: searchTerm.count)
                
                if startIndex < attributedString.endIndex && endIndex <= attributedString.endIndex {
                    attributedString[startIndex..<endIndex].backgroundColor = highlightColor
                    attributedString[startIndex..<endIndex].foregroundColor = .primary
                }
                
                searchRange = range.upperBound
            }
        }
        
        return attributedString
    }
}

/// Tab navigation component for text views  
struct TextTabNavigation: View {
    @Binding var selectedTab: TextTab
    
    enum TextTab: String, CaseIterable {
        case summary = "Summary"
        case transcript = "Transcript" 
        case audio = "Audio"
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TextTab.allCases, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    Text(tab.rawValue)
                        .font(DesignSystem.Typography.safeTextCaption)
                        .foregroundColor(selectedTab == tab ? 
                                       DesignSystem.Colors.accent : 
                                       DesignSystem.Colors.secondaryText)
                        .padding(.vertical, DesignSystem.Spacing.sm)
                        .padding(.horizontal, DesignSystem.Spacing.lg)
                        .background(
                            selectedTab == tab ?
                            DesignSystem.Colors.accent.opacity(0.1) :
                            Color.clear
                        )
                        .cornerRadius(DesignSystem.CornerRadius.small)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.textHorizontalMargin)
        .padding(.vertical, DesignSystem.Spacing.md)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

/// Container for text content with Swiss grid layout
struct TextContentContainer: View {
    let content: AnyView
    
    init<Content: View>(@ViewBuilder content: () -> Content) {
        self.content = AnyView(content())
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                content
            }
            .padding(.vertical, DesignSystem.Spacing.textVerticalMargin)
        }
        .background(DesignSystem.Colors.warmBackground)
    }
}