import Foundation

struct calculatorBrain {
    
    private var number: Double?
    
    private var Calculation:(number1: Double, symbol: String)?
    
    // get private var from other file
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    // Function that storing 1st num , symbol and making calculation
    
    mutating func calculate(symbol: String) -> Double?{
        if let n = number{
            switch symbol {
            case "%":
                return n * 0.01
            case "AC":
                return 0
            case "+/-":
                return n * (-1)
            case "=":
                return performNumForCalc(n2: n)
            default:
                Calculation = (number1: n,symbol: symbol)
            }
        }
        return nil
    }

    func performNumForCalc(n2: Double) -> Double?{
        if let n1 = Calculation?.number1, let symbol = Calculation?.symbol{
            switch symbol {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "/":
                return n1 / n2
            case "*":
                return n1 * n2
            default:
                fatalError("No such operator")
            }
        }
        return nil
    }
}
