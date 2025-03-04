import SwiftUI
import SwiftData

struct Eduskunta: View {
    @Environment(\.modelContext) var modelContext
    @State private var categories: [EdustajaCategory] = []
    @Query var edustajat: [Edustaja]
    @State private var selectedParties: Set<String> = []
    @State private var majorityResult: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List($categories) { $category in
                    NavigationLink(destination: EdustajaListView(category: category)) {
                        CategoryRow(category: $category, selectedParties: $selectedParties)
                    }
                }
                .navigationTitle("Edustajat by Puolueet")
                .onAppear {
                    if edustajat.isEmpty {
                        updateMPsFromNW(context: modelContext)
                    }
                    categories = groupEdustajatByParty(edustajat)
                }
                
                Button("Check Majority Government") {
                    checkMajorityGovernment(edustajat: edustajat, selectedParties: selectedParties, majorityResult: &majorityResult)
                }
                .padding()
                
                Text(majorityResult)
                    .padding()
            }
        }
    }
}

func groupEdustajatByParty(_ edustajat: [Edustaja]) -> [EdustajaCategory] {
    let grouped = Dictionary(grouping: edustajat, by: { $0.party })
    return grouped.map { EdustajaCategory(name: $0.key, members: $0.value) }.sorted { $0.name < $1.name }
}

func updateMPsFromNW(context: ModelContext) {
    let urlString = "https://users.metropolia.fi/~peterh/mps.json"
    
    guard let url = URL(string: urlString) else {
        print("Bad URL")
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("dataTask error: \(error.localizedDescription)")
            return
        } else {
            guard let response = response else {
                print("Bad response")
                return
            }
            print("response: \(response.expectedContentLength)")
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let parliament = try decoder.decode([Edustaja].self, from: data)
                    print("Array length: \(parliament.count)")
                    print(parliament.map { $0.last }.joined(separator: ","))
                    
                    DispatchQueue.main.async {
                        deleteAllEdustajat(context: context)
                        saveMPsToContext(parliament, context: context)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
    }
    task.resume()
}

func deleteAllEdustajat(context: ModelContext) {
    let fetchDescriptor = FetchDescriptor<Edustaja>()
    let edustajat = try? context.fetch(fetchDescriptor)
    edustajat?.forEach { context.delete($0) }
    do {
        try context.save()
    } catch {
        print("Error deleting data: \(error)")
    }
}

func checkMajorityGovernment(edustajat: [Edustaja], selectedParties: Set<String>, majorityResult: inout String) {
    let totalSeats = edustajat.count
    let selectedMPs = edustajat.filter { selectedParties.contains($0.party) }.count
    let majorityNeeded = totalSeats / 2 + 1

    if selectedMPs >= majorityNeeded {
        majorityResult = "✅ Majority Government Formed! (\(selectedMPs)/\(totalSeats))"
    } else {
        majorityResult = "❌ Not a Majority. (\(selectedMPs)/\(totalSeats))"
    }
}

func saveMPsToContext(_ mps: [Edustaja], context: ModelContext) {
    let fetchDescriptor = FetchDescriptor<Edustaja>()
    let existingEdustajat = try? context.fetch(fetchDescriptor)
    
    for mp in mps {
        if !(existingEdustajat?.contains(where: { $0.personNumber == mp.personNumber }) ?? false) {
            let newEdustaja = Edustaja(
                personNumber: mp.personNumber,
                seatNumber: mp.seatNumber,
                last: mp.last,
                first: mp.first,
                party: mp.party,
                minister: mp.minister,
                picture: mp.picture,
                twitter: mp.twitter,
                bornYear: mp.bornYear,
                constituency: mp.constituency
            )
            context.insert(newEdustaja)
        }
    }

    do {
        try context.save()
    } catch {
        print("Error saving data: \(error)")
    }
}

#Preview {
    Eduskunta()
        .modelContainer(for: [Edustaja.self])
}