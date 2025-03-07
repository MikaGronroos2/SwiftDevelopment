import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var showSheet = false
    @State private var selectedPlace: Location?
    @Binding var constituencies: Set<String>
    @State private var locations: [Location] = []
    @Binding var edustajat: [Edustaja]
    
    func getLocations(completion: @escaping () -> Void) {
        let group = DispatchGroup()
        
        for constituency in constituencies {
            group.enter()
            
            searchConstituency(constituency: constituency) { coordinate in
                if let coordinate = coordinate {
                    let newLocation = Location(name: constituency, coordinate: coordinate)
                    locations.append(newLocation)
                }
                group.leave()
            }
        }

        // Notify when all searches are complete
        group.notify(queue: .main) {
            print("Finished getting locations")
            completion()
        }
    }
    
        
    var body: some View {
        NavigationStack {
            MapReader { proxy in
                Map()
                {
                    ForEach(locations){ location in
                                Annotation(location.name, coordinate: location.coordinate) {
                                    NavigationLink(destination: ConstituencyList(edustajat: self.$edustajat, constituency: location.name)) {
                                    Image(systemName: "star.fill")
                                        .font(.headline)
                                        .padding()
                                        .foregroundStyle(.red)
                                        .clipShape(.capsule)
                                }
                            }.annotationTitles(.hidden)
                        }
                }
                }.onAppear{getLocations{
                    print("Items fetched")
                }}
        }
        
        
    }
}

