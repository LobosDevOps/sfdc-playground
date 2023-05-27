trigger ClosedOpportunityTrigger on Opportunity (after insert ,after update) {
    List<Task> taskList = new List<Task>();
    for(Opportunity opp : Trigger.new) {
        // Stage is Closed Won
        if(opp.StageName == 'Closed Won') {
            Task newTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            // Create a task
            taskList.add(newTask); 
        }
    }
    insert taskList;    
}