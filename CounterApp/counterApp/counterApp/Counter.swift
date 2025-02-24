import Foundation

class Counter: ObservableObject {
    @Published var lowerBound: Int
    @Published var upperBound: Int
    @Published var step: Int
    @Published var ops: Int
    @Published var value: Int
    
    init(lowerBound: Int = 0, upperBound: Int = 5, step: Int = 1) {
        self.lowerBound = lowerBound
        self.upperBound = upperBound
        self.step = step
        self.ops = 0
        self.value = lowerBound
    }
    
    func setStep(_ step: Int) {
        if step > 0 && step <= (upperBound - lowerBound) {
            self.step = step
        } else {
            self.step = 1
        }
    }
    
    func increment() {
        value += step
        if value > upperBound {
            value = lowerBound
        }
        ops += 1
    }
    
    func decrement() {
        value -= step
        if value < lowerBound {
            value = upperBound - (step - 1)
        }
        ops += 1
    }


}
