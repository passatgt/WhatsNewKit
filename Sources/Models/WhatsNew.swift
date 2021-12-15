import Foundation

// MARK: - WhatsNew

/// A WhatsNew object
public struct WhatsNew {
    
    // MARK: Properties
    
    /// The Version
    public let version: Version
    
    /// The Title
    public let title: Title
    
    /// The Features
    public let features: [Feature]
    
    /// The PrimaryAction
    public let primaryAction: PrimaryAction
    
    /// The optional SecondaryAction
    public let secondaryAction: SecondaryAction?
    
    // MARK: Initializer
    
    /// Creates a new instance of `WhatsNew`
    /// - Parameters:
    ///   - version: The Version. Default value `.current()`
    ///   - title: The Title
    ///   - items: The Features
    ///   - primaryAction: The PrimaryAction. Default value `.init()`
    ///   - secondaryAction: The optional SecondaryAction. Default value `nil`
    public init(
        version: Version = .current(),
        title: Title,
        features: [Feature],
        primaryAction: PrimaryAction = .init(),
        secondaryAction: SecondaryAction? = nil
    ) {
        self.version = version
        self.title = title
        self.features = features
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
    
}

// MARK: - Identifiable

extension WhatsNew: Identifiable {
    
    /// The stable identity of the entity associated with this instance.
    public var id: Version {
        self.version
    }
    
}

// MARK: - Sequence<WhatsNew>+current()

public extension Sequence where Element == WhatsNew {
    
    /// Retrieve WhatsNew where the version matches the current version in Bundle
    /// - Parameter bundle: The Bundle. Default value `.main`
    func current(
        in bundle: Bundle = .main
    ) -> WhatsNew? {
        // Initialize current WhatsNew Version
        let currentVersion = WhatsNew.Version.current(in: bundle)
        // Return first WhatsNew where the version matches
        return self.first { $0.version == currentVersion }
    }
    
}
