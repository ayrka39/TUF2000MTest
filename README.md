# TUF-2000M Data Parser
This is a test app for parsing data from Gambit live feed of TUF-2000M, an ultrasonic flowmeter based on [Modbus](https://en.wikipedia.org/wiki/Modbus) interface.

## Task
1. First, you should figure out what the raw data from the live feed means. They have several different formats of numbers, such as Real4, Long, BCD, Integer(4) etc.
<br><br>
2. Then, these numbers need to be converted to human readable ones, according to each register. 
<br><br>
3. Lastly, they should be presented in a nice way. I decided to make an iOS app. 


## Screenshots
here are some screenshots from the app.


![tuf2000mapp01](https://user-images.githubusercontent.com/16446932/29757941-2b6ee88c-8bb8-11e7-93f6-0f896a12b640.png)
![tuf2000mapp02](https://user-images.githubusercontent.com/16446932/29757942-2b8ad182-8bb8-11e7-9abd-3a001ff74a47.png)

## Usage
It is a iOS app file written with Swift. On Mac, Download a Xcode file you can see the code and run it in the simulator or check on an iPhone. It has not been published on the AppStore and most likely will not be.


## Issues
1. I had hard time to guess the meaning of the numbers and to find out the solution. Mostly, it was because of my lack of pertinent knowledge. However, it could have been easily solved with good guidline.
<br><br>
2. Gambit's own github page shows some examples, but it indicated a wrong register. It was not register 33-34, but 34-35 to get the given answer. 
<br><br>
3. I am not really sure my solution is correct, when I found that some values do not seem to be realistic, such as Fluid sound speed. 
<br><br>
4. I spent too much time to make a nicer app, which ended up being a simple, basic one, only to show the test result. I may update it later for better interface and features. 


### Thanks
I appreciate that Gambit offered this good opportunity to learn something new to me. It was a big challenge. I learned a lot.
