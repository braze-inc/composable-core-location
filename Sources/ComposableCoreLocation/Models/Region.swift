import CoreLocation

/// A value type wrapper for `CLRegion`. This type is necessary so that we can do equality checks
/// and write tests against its values.
public struct Region: Hashable {
  @available(visionOS, unavailable)
  public var rawValue: CLRegion? { _rawValue as? CLRegion }
  private let _rawValue: Any?

  public var identifier: String
  public var notifyOnEntry: Bool
  public var notifyOnExit: Bool

  @available(visionOS, unavailable)
  public init(rawValue: CLRegion) {
    self._rawValue = rawValue

    self.identifier = rawValue.identifier
    self.notifyOnEntry = rawValue.notifyOnEntry
    self.notifyOnExit = rawValue.notifyOnExit
  }

  public init(
    identifier: String,
    notifyOnEntry: Bool,
    notifyOnExit: Bool
  ) {
    self._rawValue = nil

    self.identifier = identifier
    self.notifyOnEntry = notifyOnEntry
    self.notifyOnExit = notifyOnExit
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.identifier == rhs.identifier
      && lhs.notifyOnEntry == rhs.notifyOnEntry
      && lhs.notifyOnExit == rhs.notifyOnExit
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.identifier)
    hasher.combine(self.notifyOnExit)
    hasher.combine(self.notifyOnEntry)
  }
}
