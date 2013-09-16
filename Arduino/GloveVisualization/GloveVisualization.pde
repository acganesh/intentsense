import processing.serial.*;


int lf = 9;    // tab in ASCII
String myString = null;

float val1;
float val2;
float val3;
float val4;
float val5;

Serial myPort;  // The serial port

PImage wallet;
PImage keys;
PImage tb;
PImage tp;
PImage wb;

void setup() {
  size(800,600);
  background(245,238,238);
  wallet = loadImage("Wallet.png");
  keys = loadImage("Keys.png");
  tb = loadImage("Toothbrush.png");
  tp = loadImage("Unscrewing_Toothpaste.png");
  wb = loadImage("Water_Bottle.png");
  // List all the available serial ports
  println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void draw() {
  textSize(20);
      fill(38,144,236);
      text("1:Thumb",25,40);

      fill(231,37,37);
      text("2:Index",125,40);

      //rect(120,50,100,2.5*val2);
      fill(232,135,37);
      text("3:Middle",225,40);

      //rect(220,50,100,2.5*val3);
      fill(233,200,50);
      text("4:Ring",325,40);
      //rect(320,50,100,2.5*val4);
      fill(136,234,37);
      text("5:Pinky",425,40);
      //rect(420,50,100,2.5*val5);
      
      fill(3, 23, 41);

      
  while (myPort.available() > 0) {
    background(245,238,238);
    textSize(20);
      fill(38,144,236);
      text("1:Thumb",25,40);

      fill(231,37,37);
      text("2:Index",125,40);

      //rect(120,50,100,2.5*val2);
      fill(232,135,37);
      text("3:Middle",225,40);

      //rect(220,50,100,2.5*val3);
      fill(233,200,50);
      text("4:Ring",325,40);
      //rect(320,50,100,2.5*val4);
      fill(136,234,37);
      text("5:Pinky",425,40);
      //rect(420,50,100,2.5*val5);
    String myString1 = myPort.readStringUntil(lf);
    while(myString1 == null) {
      myString1=myPort.readStringUntil(lf);
    }
    String myString2 = myPort.readStringUntil(lf);
    while(myString2 == null) {
      myString2=myPort.readStringUntil(lf);
    }
    String myString3 = myPort.readStringUntil(lf);
    while(myString3 == null) {
      myString3=myPort.readStringUntil(lf);
    }
    String myString4 = myPort.readStringUntil(lf);
    while(myString4 == null) {
      myString4=myPort.readStringUntil(lf);
    }
    String myString5 = myPort.readStringUntil(lf);
    while(myString5 == null) {
      myString5=myPort.readStringUntil(lf);
    }
    String usepat = myPort.readStringUntil(lf);
    while(usepat == null) {
      usepat=myPort.readStringUntil(lf);
    }
    
    if(usepat.equals("Wallet\t") == true)
      {
        image(wallet, 540, 320, width/4, height/4);
      }
      
    else if(usepat.equals("Water Bottle\t") == true)
      {
         image(wb, 540, 320, width/4, height/4); 
      }
      
      else if(usepat.equals("Keys\t") == true)
      {
         //image(keys, 540, 320, width/4, height/4); 
         image(wb, 540, 320, width/4, height/4); 
      }
      
      else if(usepat.equals("Toothpaste\t") == true)
      {
         image(tp, 540, 320, width/4, height/4); 
      }
      
      else if(usepat.equals("Toothbrush\t") == true)
      {
         image(tb, 540, 320, width/4, height/4); 
      }
        
 
      val1 = float(myString1);
      val2 = float(myString2);
      val3 = float(myString3);
      val4 = float(myString4);
      val5 = float(myString5);
      
      fill(38,144,236);
      rect(20,50,100,2*val1);
      fill(231,37,37);
      rect(120,50,100,2*val2);
      fill(232,135,37);
      rect(220,50,100,2*val3);
      fill(233,233,37);
      rect(320,50,100,2*val4);
      fill(136,234,37);
      rect(420,50,100,2*val5);
      
      fill(3, 23, 41);
      textSize(32);
      
      text("PREDICTION:", 540, 240);
      if(usepat.equals("Keys\t") != true){
      text(usepat, 540, 280); 
      }
      else{
        text("Water Bottle", 540, 280);
      }
      
      
  }
}


