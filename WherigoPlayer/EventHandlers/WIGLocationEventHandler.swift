//
//  WIGLocationEventHandler.swift
//  WhereIGoPlayer
//
//  Created by Balázs Horváth on 2020. 12. 30..
//

class WIGLocationEventHandler: NSObject, WIGLocationServiceProtocol {
    func getLatitude() -> Double {
        Log.debug("getLatitude")
        return LocationService.shared.location?.coordinate.latitude ?? 0
    }

    func getLongitude() -> Double {
        Log.debug("getLongitude")
        return LocationService.shared.location?.coordinate.longitude ?? 0
    }

    func getAltitude() -> Double {
        Log.debug("getAltitude")
        return LocationService.shared.location?.altitude ?? 0
    }

    func getHeading() -> Double {
        Log.debug("getHeading")
        return LocationService.shared.location?.course ?? 0
    }

    func getPrecision() -> Double {
        Log.debug("getPrecision")
        let horizontalAccuracy = LocationService.shared.location?.horizontalAccuracy ?? -1
        let verticalAccuracy = LocationService.shared.location?.verticalAccuracy ?? -1

        if horizontalAccuracy < 0 || verticalAccuracy < 0 {
            // Precision data is not available, return with a big number until data is available
            return 100
        }

        return (horizontalAccuracy + verticalAccuracy) / 2
    }

    func getState() -> Int32 {
        Log.debug("getState")
        switch LocationService.shared.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            return WIGLocationService.ONLINE
        case .notDetermined:
            return WIGLocationService.CONNECTING
        case .restricted, .denied:
            return WIGLocationService.OFFLINE
        @unknown default:
            return WIGLocationService.OFFLINE
        }
    }

    func connect() {
        Log.debug("connect")
    }

    func disconnect() {
        Log.debug("disconnect")
    }
}
