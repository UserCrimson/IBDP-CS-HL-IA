# CS-IA
import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("Snowflake")
                    .resizable()
                    .scaledToFit()
                    .frame(width:125, height:125)
                    .navigationTitle("Homepage")
                    .offset(y: -20)
                    .frame(width:50, height:50)
                
                NavigationLink(destination: Text("Destination"), label:{ Text("ENTER")})
            }
        }
    }
}
      
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            VStack{
                Image("Snowflake")
                    .resizable()
                    .scaledToFit()
                    .frame(width:125, height:125)
                    .navigationTitle("Homepage")
                    .offset(y: -20)
                    .frame(width:50, height:50)
                
                NavigationLink(destination: Text("Destination"), label: { Image("Snowflake")})
                    .frame(width:20, height:20)
            }
        }
    }
}







