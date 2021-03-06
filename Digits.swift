public extension Int {
    public func digits(radix: Int) -> [Int] {
        var worker = self
        var digits = [Int]()
        while worker > 0 {
            let digit = worker % radix
            digits.insert(digit, atIndex: 0)
            worker = worker / radix
        }
        return digits
    }
}

public extension Array where Element: protocol<IntegerArithmeticType, IntegerLiteralConvertible> {
    public func unDigits(radix: Element) -> Element {
        if self.isEmpty {
            return 0
        } else {
            return self.dropFirst().reduce(self.first!) { (accum, n) in (accum * radix) + n }
        }
    }
}
