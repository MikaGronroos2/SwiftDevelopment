import MapKit

func searchConstituency(constituency: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = constituency

    let search = MKLocalSearch(request: request)
    search.start { response, error in
        if let error = error {
            print("Search failed: \(error.localizedDescription)")
            completion(nil)
            return
        }

        if let response = response, let firstItem = response.mapItems.first {
            let coordinate = firstItem.placemark.coordinate
            completion(coordinate)
        } else {
            print("No results found")
            completion(nil)
        }
    }
}
