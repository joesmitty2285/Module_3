import SwiftUI

struct ContentView: View {
    let grid = [
        ["C", "+/-", "%", "/"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["", "0", ".", "="]
    ]
    
    let operators = ["/", "+", "X", "%"]
    
    @State var calcInput = ""
    @State var calcResults = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(calcInput)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                Spacer()
                Text(calcResults)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { cell in
                        Button(action: { buttonPressed(cell: cell) }, label: {
                            Text(cell)
                                .foregroundColor(buttonColor(cell))
                                .font(.system(size: 50, weight: .heavy))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.gray.opacity(cell.isEmpty ? 0 : 0.2))
                                .cornerRadius(10)
                        })
                    }
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
    }
    
    func buttonColor(_ cell: String) -> Color {
        if(cell == "C") {
            return .red
        }
        
        if(cell == "-" || cell == "=" || cell == "+/-" || operators.contains(cell)) {
            return .orange
        }
        
        return .white
    }
    
    func buttonPressed(cell: String) {
        switch (cell) {
        case "C":
            calcInput = ""
            calcResults = ""
        case "=":
            // Placeholder for calculation logic
            break
        case "-":
            // Placeholder for calculation logic
            break
        case "X", "/", "%", "+", "+/-":
            // Placeholder for calculation logic
            break
        default:
            calcInput += cell
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
