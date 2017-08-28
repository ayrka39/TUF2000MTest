# TUF-2000M Data Parser
This is a test app for parsing data from Gambit live feed of TUF-2000M, an ultrasonic flowmeter based on [Modbus](https://en.wikipedia.org/wiki/Modbus) interface.

## Task
1. First, you should figure out what the raw data from the live feed means. They have several different formats of numbers, such as Real4, Long, BCD, Integer(4) etc.
<br><br>
2. Then, these numbers need to be converted to human readable ones, according to each register. 
<br><br>
3. Lastly, they should be presented in a nice way. I decided to make an iOS app. 

<br>
here are some screenshots from the app.
![tuf2000app01](https://user-images.githubusercontent.com/16446932/29757814-6900e0ac-8bb7-11e7-96f6-05b891cd12af.png)
