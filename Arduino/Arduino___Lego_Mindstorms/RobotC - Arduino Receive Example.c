#pragma config(Sensor, S1,TIR,sensorI2CCustom)

/*
How to connect your LEGO MINDSTORMS NXT with an Arduino.
http://www.dexterindustries.com/howto/
*/


// First, define the Arduino Address
// Address is 0x0A on the Arduino:  					(Binary)  1010
// Bit shifted out with one 0, that becomes: 	(Binary) 10100
// Which is 0x14
#define ARDUINO_ADDRESS	0x14
#define ARDUINO_PORT S1

ubyte I2Cmessage[22];
char I2Creply[20];

void i2c_read_registers_text(ubyte register_2_read, int message_size, int return_size){
  memset(I2Creply, 0, sizeof(I2Creply));
	message_size = message_size+3;

  I2Cmessage[0] = message_size;    // Messsage Size
  I2Cmessage[1] = ARDUINO_ADDRESS;
  I2Cmessage[2] = register_2_read; // Register
  sendI2CMsg(S1, &I2Cmessage[0], return_size);
  wait1Msec(20);

  readI2CReply(ARDUINO_PORT, &I2Creply[0], return_size);

  int i = 0;
  while(true){
  	writeDebugStream("%c", I2Creply[i]);
  	i++;
  	if(I2Creply[i] == 0) break;
  }
  writeDebugStreamLine(" ");
}

task main()
{
	while(true){
		// i2c_write_registers(0x01, 0x01, 0x00, 0x0A, 0, 0, 0);
		i2c_read_registers_text(0x01, 0, 10);		// Here we're going to get back "Dexter" because we're writing to the 0x01 register.
		i2c_read_registers_text(0x00, 0, 10);		// Here we're going to get back "Industries" because we're weriting to the 0x00 register.
		wait1Msec(1000);
	}

}
