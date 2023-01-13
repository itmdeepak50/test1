({
    startTimer : function(component, event, helper) {
        let timerOn = true; 
        timer(5);
        
        
        /* var countDownDate = new Date(component.get("v.endTime"));
        console.log("o hai kya batta hai    "+countDownDate);
        // Update the count down every 1 second
        // 
        // 
        // 
        var time=Date.now();
        console.log( "timed yd duygfd    "+    time);
        var timer = setInterval(function() {
         
            // Get todays date and time
            var now = new Date().getTime();
            console.log("o hai kya batta hai 2   "+now);
         
            // Find the distance between now and the count down date
            var distance = countDownDate - now;
             console.log("o hai kya batta hai 3   "+distance);
         
            // Time calculations for days, hours, minutes and seconds
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
         
            // Display the result in the element with id="demo"
            var timeLeft =  hours + "h " + minutes + "m " + seconds + "s ";
            component.set("v.timeLeft", timeLeft);
        }, 1000);*/
        
       
        
        function timer(remaining) {
            var m = Math.floor(remaining / 60);
            var s = remaining % 60;
            
            m = m < 10 ? '0' + m : m;
            s = s < 10 ? '0' + s : s;
            var t = m + ':' + s;
            console.log("dsadsad  "+t);
            component.set("v.timeLeft",t);
            remaining -= 1;
            
            if(remaining >= 0 && timerOn) {
                setTimeout(function() {
                    timer(remaining);
                }, 1000);
                return;
            }
            
            if(!timerOn) {
                // Do validate stuff here
                return;
            }
            
            // Do timeout stuff here
            alert('Timeout for otp');
        }
        
        
     
        
        
        
        
    }
})