//
//  JBTimer
//
//  Copyright (c) 2016 Juan Pablo  Boero Alvarez
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



import Foundation

/**
 Repeating timer based on Grand Central Dispatch. [GitHub link](https://github.com/JuanPabloBoero/JBTimer/)
 
 - Parameter timeInSecs: An integer that defines the desired repeating time in seconds.
 - Parameter closure: closure that will execute the tasks defined inside.
 - Returns: `Void`
 - Version: 1.0
 - Author: Juan Pablo Boero Alvarez
 */
class JBTimer {
    
    var timer: dispatch_source_t!
    
    
    /**
     Starts the repeating timer each time that `timeInSecs` lapses.
     
     - Parameter timeInSecs: An integer that defines the desired repeating time in seconds.
     - Parameter closure: closure closure that will execute the tasks defined inside.
     
     */
    func repeateTimer(timeInSecs timeInSecs: Int, closure:()->Void) {
        
        let queue = dispatch_queue_create("com.domain.app.timer", nil)
        
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, UInt64(Double(timeInSecs) * Double(NSEC_PER_SEC)), 1 * NSEC_PER_SEC) // with leeway of 1 second
        
        dispatch_source_set_event_handler(timer, closure)
        
        dispatch_resume(timer)
        
    }
    
    /**
     Stops the repeating timer.
     */
    func stopTimer() {
        
        if timer != nil{
         
            dispatch_source_cancel(timer)
            
        }
        timer = nil
    }
    
}
