import CoreLocation
import Dependencies
import XCTestDynamicOverlay

extension LocationManager {

  /// The failing implementation of the ``LocationManager`` interface. By default this
  /// implementation stubs all of its endpoints as functions that immediately call `XCTFail`.
  ///
  /// This allows you to test an even deeper property of your features: that they use only the
  /// location manager endpoints that you specify and nothing else. This can be useful as a
  /// measurement of just how complex a particular test is. Tests that need to stub many endpoints
  /// are in some sense more complicated than tests that only need to stub a few endpoints. It's not
  /// necessarily a bad thing to stub many endpoints. Sometimes it's needed.
  ///
  /// As an example, to create a failing manager that simulates a location manager that has already
  /// authorized access to location, and when a location is requested it immediately responds
  /// with a mock location we can do something like this:
  ///
  /// ```swift
  /// // Send actions to this subject to simulate the location manager's delegate methods
  /// // being called.
  /// let locationManagerSubject = PassthroughSubject<LocationManager.Action, Never>()
  ///
  /// // The mock location we want the manager to say we are located at
  /// let mockLocation = Location(
  ///   coordinate: CLLocationCoordinate2D(latitude: 40.6501, longitude: -73.94958),
  ///   // A whole bunch of other properties have been omitted.
  /// )
  ///
  /// var manager = LocationManager.failing
  ///
  /// // Override any CLLocationManager endpoints your test invokes:
  /// manager.authorizationStatus = { .authorizedAlways }
  /// manager.delegate = { locationManagerSubject.eraseToEffect() }
  /// manager.locationServicesEnabled = { true }
  /// manager.requestLocation = {
  ///   .fireAndForget { locationManagerSubject.send(.didUpdateLocations([mockLocation])) }
  /// }
  /// ```
  public static var testValue = Self(
    accuracyAuthorization: unimplemented("accuracyAuthorization", placeholder: .fullAccuracy),
    authorizationStatus: unimplemented("authorizationStatus", placeholder: .notDetermined),
    delegate: unimplemented("delegate", placeholder: .finished),
    dismissHeadingCalibrationDisplay: unimplemented("dismissHeadingCalibrationDisplay"),
    heading: unimplemented("heading"),
    headingAvailable: unimplemented("headingAvailable"),
    isRangingAvailable: unimplemented("isRangingAvailable"),
    location: unimplemented("location"),
    locationServicesEnabled: unimplemented("locationServicesEnabled"),
    maximumRegionMonitoringDistance: unimplemented(
      "maximumRegionMonitoringDistance", placeholder: .zero),
    monitoredRegions: unimplemented("monitoredRegions", placeholder: []),
    requestAlwaysAuthorization: unimplemented("requestAlwaysAuthorization"),
    requestLocation: unimplemented("requestLocation"),
    requestWhenInUseAuthorization: unimplemented("requestWhenInUseAuthorization"),
    requestTemporaryFullAccuracyAuthorization: unimplemented(
      "requestTemporaryFullAccuracyAuthorization"),
    set: unimplemented("set"),
    significantLocationChangeMonitoringAvailable: unimplemented(
      "significantLocationChangeMonitoringAvailable"),
    startMonitoringForRegion: unimplemented("startMonitoringForRegion"),
    startMonitoringSignificantLocationChanges: unimplemented(
      "startMonitoringSignificantLocationChanges"),
    startMonitoringVisits: unimplemented("startMonitoringVisits"),
    startUpdatingHeading: unimplemented("startUpdatingHeading"),
    startUpdatingLocation: unimplemented("startUpdatingLocation"),
    stopMonitoringForRegion: unimplemented("stopMonitoringForRegion"),
    stopMonitoringSignificantLocationChanges: unimplemented(
      "stopMonitoringSignificantLocationChanges"),
    stopMonitoringVisits: unimplemented("stopMonitoringVisits"),
    stopUpdatingHeading: unimplemented("stopUpdatingHeading"),
    stopUpdatingLocation: unimplemented("stopUpdatingLocation")
  )

}
