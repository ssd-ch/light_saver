#!mruby

serial = Serial.new(0)
serial.println "Hello, mruby."

pinMode(10, 1)
pinMode(11, 1)

usb = Serial.new(0)
@OFFSET = 1.65 / 3.3 * 4096 # 1.65V 0g
@CONVERT = 3.3 / 4096 / 0.66 # 0.66V/g
analogReference(3) #12bit
200.times do |i|
    x = (analogRead(14) - @OFFSET) / 2047 * 90
    y = (analogRead(15) - @OFFSET) / 2047 * 90
    z = (analogRead(16) - @OFFSET) / 2047 * 90
     
    usb.print("x: ")
    usb.print(x.to_s)
    usb.print(" y: ")
    usb.print(y.to_s)
    usb.print(" z: ")
    usb.println(z.to_s)
    
    #serial.println "#{i}: led #{i % 2}"
    if y > 45 then
        digitalWrite(10, 1)
        digitalWrite(11, 0)
    else
        digitalWrite(10, 0)
        digitalWrite(11, 1)
    end
    
    delay(200)
end