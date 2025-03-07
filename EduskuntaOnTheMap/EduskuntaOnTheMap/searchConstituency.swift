import MapKit

func searchConstituency(named constituency: String) {
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = constituency

    let search = MKLocalSearch(request: request)
    search.start { response, error in
        if let response = response {
            let mapItems = response.mapItems
            for item in mapItems {
                print("Found: \(item.name ?? "Unknown") at \(item.placemark.coordinate)")
            }
        } else if let error = error {
            print("Search failed: \(error.localizedDescription)")
        }
    }
}
