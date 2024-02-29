//
//  ContentView.swift
//  toDoListMobile
//
//  Created by StudentAM on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    //private state variables
    //keeps track of count
    @State private var count: Int = 0
    //keeps track of the task entered
    @State private var task: String = ""
    //keeps track of all of the items in the list
    @State private var taskList: [String] = []
    
    var body: some View {
        //used to display "To-Do List" title
        NavigationView{
            VStack {
                    
                HStack{
                    //displays the current count
                    Text("Number of tasks: \(count)")
                        .padding()
                    //alternate styling:                   .frame(maxWidth: .infinity, alignment: .leading)
                    //used for formatting it to the left
                    Spacer()
                }
            
                //textfield for users to enter a task
                TextField("Enter A New Task", text: $task)
                    //styling
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
                HStack{
                    
                    //button for adding a task
                    Button(action: {
                        //if statement to check that there is a task entered into the text field
                        if !task.isEmpty {
                            //adds the task entered to the task list
                            taskList.append(task)
                            //updates the count
                            count = taskList.count
                            //clears the text field once task has been added to the list
                            task = ""
                        }
                        
                    }, label:{
                        //the text on the add task button
                        Text("Add Task")
                            //styling
                            .padding()
                            //condition for checking if the button should be blue or gray by checking if there is text in the text field
                            .background(task.count > 0 ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    
                    //button for removing all tasks
                    Button(action: {
                        //statement checks if there are tasks to be removed
                        if taskList.count > 0{
                            //resetting the task list
                            taskList = []
                            //resetting the count
                            count = 0
                        }
                    }, label: {
                        //the text for the remove all tasks button
                        Text("Remove All Tasks")
                            //styling
                            .padding()
                            //conddition for checking if the button should be blue or gray by checking if there are items in the list
                            .background(taskList.count > 0 ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                    //formatting and styling
                    .padding()
                
                //the list of to-dos
                List{
                    //displaying the items in the taskList array
                    ForEach(taskList, id: \.self){ item in
                        Text("\(item)")
                    }
                    //the function for being able to swipe and delete individual tasks
                    .onDelete(perform: deleteTask)
                }
            }
            //the title
            .navigationBarTitle("To-Do List")
        }
    }
    
    //function for deleting a specific task and updating the counter
    func deleteTask(offset: IndexSet){
        taskList.remove(atOffsets: offset)
        //subtracts 1 from the task count to account for the task deleted
        count -= 1
    }
}

#Preview {
    ContentView()
}
