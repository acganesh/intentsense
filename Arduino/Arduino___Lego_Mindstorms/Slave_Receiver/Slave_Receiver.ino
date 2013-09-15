// I2C Slave Receiver
// How to send data from the LEGO Mindstorms NXT to the Arduino.
// For LEGO Mindstorms

// Demonstrates how to connect a LEGO MINDSTORMS to an Arduino and Send commands.
// A4 - SDA
// A5 - SCL
// See our website, www.dexterindustries.com/howto for more information on the physical setup.

#include <Wire.h>

void setup()
{
  Wire.begin(0x0A);             // Start I2C on Address 0x0A
  Wire.onReceive(receiveI2C);   // Receive Event from Master
  Serial.begin(9600);           // We will spit it back out on the serial line.
}

void loop()
{
  delay(1);
}

// When data is received, this function is called.
void receiveI2C(int bytesIn)
{
  while(1 < Wire.available()) // loop through all but the last
  {
    char c = Wire.read();     // Receive the incoming byte
    Serial.print(c);          // Print the incoming byte as a character on the Serial line.
  }
  int x = Wire.read();        // Read the incoming byte
  Serial.println(x);          // Print the incoming byte
}
