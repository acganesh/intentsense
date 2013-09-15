#pragma config(Sensor, S1,TIR,sensorI2CCustom)

/*

*/


// First, define the Arduino Address
// Address is 0x0A on the Arduino:  					(Binary)  1010
// Bit shifted out with one 0, that becomes: 	(Binary) 10100
// Which is 0x14
#define ARDUINO_ADDRESS	0x14
#define ARDUINO_PORT S1

ubyte I2Cmessage[22];
ubyte I2Creply[20];

void i2c_read_registers_text(ubyte register_2_read, int message_size, int return_size){
  memset(I2Creply, 0, sizeof(I2Creply));

  I2Cmessage[0] = message_size;    // Messsage Size
  I2Cmessage[1] = ARDUINO_ADDRESS;
  I2Cmessage[2] = register_2_read; // Register
  sendI2CMsg(S1, &I2Cmessage[0], return_size);
  wait1Msec(20);

  readI2CReply(ARDUINO_PORT, &I2Creply[0], return_size);
  string returned_string;
  ubyte *I2Creply_pointer[20];
  memcpy(I2Creply_pointer, I2Creply, sizeof(I2Creply));
  StringFromChars(returned_string, I2Creply_pointer);
  writeDebugStreamLine(returned_string);
  writeDebugStreamLine(" ");
}

void i2c_write_registers(ubyte register_2_write, int message_size, int return_size, ubyte byte1, ubyte byte2, ubyte byte3, ubyte byte4){
  memset(I2Creply, 0, sizeof(I2Creply));

  message_size = message_size+3;

  I2Cmessage[0] = message_size;    // Messsage Size
  I2Cmessage[1] = ARDUINO_ADDRESS;
  I2Cmessage[2] = register_2_write; // Register

  I2Cmessage[3] = byte1;
  I2Cmessage[4] = byte2;
  I2Cmessage[5] = byte3;
  I2Cmessage[6] = byte4;

  sendI2CMsg(ARDUINO_PORT, &I2Cmessage[0], return_size);
  wait1Msec(20);
}

/*


*/

task main()
{
	while(true){
		i2c_write_registers(0x01, 0x01, 0x00, 0x0A, 0, 0, 0);
		writeDebugStreamLine("Written!");
		wait1Msec(1000);
	}

}
