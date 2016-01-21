# JBTimer
Swift Grand Central Dispatch Repeating Timer.

Ment for repeating tasks without the overhead of NSTimer.

Based on [this](http://stackoverflow.com/q/25951980/1634890) StackOverFlow question 
and Rob [answer](http://stackoverflow.com/a/25952724/1634890).

# Usage:

1. Add JBTimer.swift to your project (drag and drop)
2. From your ViewController(or wherever you might want to use it) add a variable:

  `let myTimer = JBTimer()`
  
3. Then you can start it like this:

```
//Where 2 is seconds, for closure auto-creation hit enter when suggestion is over it, 
//you have to handle weak or unowned self.
myTimer.repeateTimer(2) { [weak self] () -> Void in
            
            //Do your stuff inside this closure
            
            //I recommend using NSLog when testing time sensitive stuff, since it prints date to the logs.
            NSLog("Working \(self!.description)")
            
        }
```

4. Later on you can modify the object:
```
myTimer.repeateTimer(10) { () -> Void in
            
            //Do your stuff inside this closure
            
            print("This starts to feel good, every 10 seconds")
            
        }
```
5. When bored of it, just call:
`myTimer.stopTimer()`

#Attention:
If you use it on a non global scope(local variable), for example inside an `if` statement, it will only work 
while in that scope, for example if you want the timer to live while in a `ViewController` declare the object 
at a class scope variable.

This timer was ment for cpu cycles efficiency, so **IT IS NOT TIME CRITICAL**, dont use it on things you need time critic response, also it has a [**leeway**](https://developer.apple.com/library/mac/documentation/General/Conceptual/ConcurrencyProgrammingGuide/GCDWorkQueues/GCDWorkQueues.html) of 1 second to improve energy use. It gets more exact when the cpu is less busy, you can do tests using NSLog and comparing timestamps of fired events.

#Suggestion:
If using in a `ViewController` you might want to `.stopTimer()` when `viewWillDisappear` and/or in `viewWillUnload`.
Also you might want to re-start or re-create the timer in your `viewWillAppear` and/or `viewDidAppear`.

#Known Bug
The first time you run the timer it fires the block instantly, not sure why yet, any help is appreciated.

[MIT Licensed](https://opensource.org/licenses/MIT)
