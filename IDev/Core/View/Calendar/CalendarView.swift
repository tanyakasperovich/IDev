//
//  CalendarView.swift
//  IDev
//
//  Created by Татьяна Касперович on 19.09.23.
//

import SwiftUI

// Date Value Model...

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

struct CalendarView: View {
    @State var currentDate: Date = Date()
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20){
                        
                        // Custom Date Picker...
                        CustomDatePicker(currentDate: $currentDate)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Image(systemName: "person.fill")
                    }),
                trailing:
                    NavigationLink(
                    destination: ProfileView(),
                    label: {
                        Image(systemName: "gear")
                           //.foregroundColor(Color("ColorElements"))
                    })
            )
    }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}


struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0

    @State private var newTask = ""
    @State private var buttonAddTaskIsAction = false
    @State private var date = Date()
    
    
    @State private var disclosureExpanded = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Days...
            let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                     
//            // Today Date View...
//
//            HStack {
//                DatePicker("Today", selection: $date, displayedComponents: [.hourAndMinute, .date])
//                //.labelsHidden()
//                    .frame(height: 30)
//                    .padding()
//                    .background(ShapeBackground(interfaceModel: InterfaceModel(nameColor: Color.theme.accent, cornerRadius: 15, opacity: 0.02)))
//            }
//            .padding(.horizontal, 10)
            
            // Month View...
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                
                    Text(extraDate()[1])
                        .font(.title.bold())
                       .padding(.vertical, 5)
                        .frame(maxWidth: 170)
                        .background(RoundedRectangleShape(color: .accentColor))
                }//VStack
                
                Spacer(minLength: 0)
                
              //  HStack {
                    Button {
                        withAnimation{
                            currentMonth -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                          // .foregroundColor(Color.theme.accent)
                    }
                    
                    Button {
                        withAnimation{
                            currentMonth += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                         //   .foregroundColor(Color.theme.accent)
                    }
                //}

                
            }//HStack
            .padding(.horizontal)
            

            
            // Day View...
            HStack(spacing: 0){
                ForEach(days,id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.accentColor)

                }
            }
            
            // Dates...
            // Lazy Grid...
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 5) {
                
                ForEach(extractDate()){value in
               
                    CardView(value: value)
                        .background(
                            RoundedRectangleShape(color: .accentColor)
                                .padding(.horizontal, 3)
                                 .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1: 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            } //LazyVGrid
            .padding(.vertical)
            .padding(.horizontal, 5)
//            .background(RoundedRectangle(cornerRadius: 15)
//                            .fill(Color.theme.accent)
//                            .opacity(0.05)
//                            .shadow(radius: 1, x: 4, y: 4)
//            )
            .background(
                RoundedRectangleShape(color: .accentColor)
                    .opacity(0.2)
            )
            .padding(.horizontal, 10)
 
            
            
            if buttonAddTaskIsAction {
                HStack{
                    Button {
                        newTask = ""
                        buttonAddTaskIsAction = false
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.accentColor)
                        
                    }

                    TextField("New Task", text: $newTask)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.accentColor)
                    
                    Button {
                        // .append(newTask)
                        newTask = ""
                        buttonAddTaskIsAction = false
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                           // .background(Color.theme.clover, in: Capsule())
                            .background(

                                RoundedRectangleShape(color: .accentColor)
                                )
                    }
                    .disabled(newTask.isEmpty)
                }
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .foregroundColor(.white)
               // .background(.ultraThinMaterial)
                
            }
            else {
                HStack{
                    Button {
                        
                    } label: {
                        Text("Add Remainder")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            //.background(Color.theme.accent, in: Capsule())
                            .background(
                                RoundedRectangleShape(color: .accentColor)
                                )
                                      
                    }
                    
                    
                    Button {
                        buttonAddTaskIsAction = true
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                          //  .background(Color.theme.clover, in: Capsule())
                            .background(
                                RoundedRectangleShape(color: .accentColor)
                                )
                    }
                    
                
                }
                .padding(.horizontal)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .foregroundColor(.white)
                //.background(.ultraThinMaterial)
                
            }
            
            
            
            // Tasks
            VStack(spacing: 10){

                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .foregroundColor(.accentColor)
      
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(task.task){task in
                    
                        VStack(spacing: 10) {
                            DisclosureGroup(
                             isExpanded: $disclosureExpanded,
                             content: {
                                 VStack() {
                                     Text(task.title)
                                         .padding()
                                 }
                             },
                             label: {
                                 HStack(alignment: .top) {
                                     // For Custom Timing...
                                     Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
                                
                                     Text(task.title)
                                         .font(.title2.bold())
                                         .padding(.horizontal)
                                 }
                             }
                            )
                         
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangleShape(color: .accentColor)
                                .opacity(0.3)
                        )
                        
                        
                        
//                        VStack(alignment: .leading, spacing: 10) {
//
//                            // For Custom Timing...
//                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
//
//                            Text(task.title)
//                                .font(.title2.bold())
//                        }
//                        .padding(.vertical)
//                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            ShapeBackground(interfaceModel: InterfaceModel(nameColor: Color.theme.clover, cornerRadius: 15, opacity: 0.3))
//                        )
                        
                    }
                }
                else{
                    
                    Text("No Task Found")
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }//VStack
        .onChange(of: currentMonth) { newValue in
            
            // updating Month...
            currentDate = getCurrentMonth()
        }
    }//Body
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        
        VStack {
            
            if value.day != -1{
//            Text("\(value.day)")
//                .font(.title3.bold())
                
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    HStack {
                        Circle()
                            .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? Color.accentColor : Color.accentColor.opacity(0.75))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white.opacity(0.5) : Color.accentColor.opacity(0.9))
                            .frame(width: 8, height: 8)
                    }
                   
                }
                else{
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                     
                    Spacer()
                }
                
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    // checking dates...
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extrating Year And Month for display...
    func extraDate()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current

        //Getting Current Month Date...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current

        //Getting Current Month Date...
        let currentMonth = getCurrentMonth()
        
       var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            // getting day...
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

// Extending Date to get Current Month Dates...
extension Date{
    
    func getAllDates()->[Date]{
        
        let calendar = Calendar.current
        
        // getting start Date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
       
        
        // getting date...
        return range.compactMap{ day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}


// Task...........................
// Task Model and Sample Tasks...
// Array of tasks...
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
    var disclosureExpanded: Bool
    var description: String
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}


// МОЖНО УДАЛИТЬ....рандомное распределение тасков...
// Sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
     
     TaskMetaData(task: [
         
         Task(title: "Talk to iJustine", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
         Task(title: "iPhone 13 Great Design Change😂", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
         Task(title: "Noting Much Workout !!!", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: 1)),
     
     TaskMetaData(task: [
         
         Task(title: "Talk to Jenna Ezarik", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: -3)),
     
     TaskMetaData(task: [
         
         Task(title: "Meeting with Tim Cook", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: -8)),
     
     TaskMetaData(task: [
         
         Task(title: "Next Version of SwiftUI", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: 10)),
     
     TaskMetaData(task: [
         
         Task(title: "Nothing Much Workout !!!", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: -22)),
     
     TaskMetaData(task: [
         
         Task(title: "iPhone 13 Great Design Change😂", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: 15)),
     
     TaskMetaData(task: [
         
         Task(title: "App Updates...", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     ], taskDate: getSampleDate(offset: -20)),
 ]









class TaskViewModel: ObservableObject {
    
    
    // Sample Tasks...
   @Published var tasks: [Task] = [
    
            Task(title: "Talk to iJustine", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
            Task(title: "iPhone 13 Great Design Change😂", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
            Task(title: "Noting Much Workout !!!", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
        
            Task(title: "Talk to Jenna Ezarik", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
    
            Task(title: "Meeting with Tim Cook", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
       
            Task(title: "Next Version of SwiftUI", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
      
            Task(title: "Nothing Much Workout !!!", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
     
            Task(title: "iPhone 13 Great Design Change😂", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
    
            Task(title: "App Updates...", disclosureExpanded: false, description: "Talk to iJustine Talk to iJustine"),
       
    ]
}

