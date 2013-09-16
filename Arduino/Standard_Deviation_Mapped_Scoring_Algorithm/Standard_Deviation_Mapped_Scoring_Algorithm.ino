

void setup() { 
  Serial.begin(9600);

} 

void loop() {
  /*
   int vals[5][5] = {
          {428,439,348,387,344},
          {421,396,331,378,324},
          {358,421,357,417,379},
          {380,341,268,299,248},
          {353,335,272,333,270}
        };
        */
      int vals[5][5] = {
          {44,67,143,116,152},
          {53,114,159,125,170},
          {139,87,136,85,119},
          {109,173,213,205,241},
          {146,180,210,171,220}
        };
        /*
    double stdev[5][5] = {
          {7,13,9,14,15},
          {5,10,16,29,40},
          {10,10,11,11,11}, // used to be {28, 10, 14, 17, 14}
          {7,8,10,10,3},
          {14,8,13,10,14}
        };
        */
    double stdev[5][5] = {
          {15, 14, 8, 14, 14},
          {7, 11, 14, 29, 37},
          {39, 11, 13, 17, 13},
          {9, 9, 9, 5, 3},
          {19, 9, 11, 10, 13}         
        };
    int maxes[5] = {273, 266, 220, 250, 233};
    int mins[5] = {460, 501, 512, 500, 508};
    int dmax = 255;
    int dmin = 0;
    // Maps and mins are switched to invert range with map function
    double score[5] = {0, 0, 0, 0, 0};
    double diff[5][5] = {
          {0,0,0,0,0},
          {0,0,0,0,0},
          {0,0,0,0,0},
          {0,0,0,0,0},
          {0,0,0,0,0}
    };
    double minscore = 99999999;
    int minscoreindex = 0;
  String configs[5] = {"Water Bottle", "Keys", "Wallet", "Toothbrush","Toothpaste"};
  for (int i=0; i<5; i++){
    Serial.print(map(analogRead(i),mins[i],maxes[i],dmin,dmax));
    Serial.print("\t");
  }
  for (int j=0; j<5; j++){
    for (int k=0; k<5; k++){
      diff[j][k] = map(analogRead(k),mins[k],maxes[k],dmin,dmax)-vals[j][k];
      score[j] = score[j] + abs(diff[j][k]/stdev[j][k]);
    }
    //Serial.print(score[j]);
    if(score[j]<minscore){
      minscore = score[j];
      minscoreindex = j;
    }
    //Serial.print("\t");
  }
Serial.print(configs[minscoreindex]);  
Serial.print("\t");
//   Serial.print(j+1);
//   Serial.print(":");
      boolean good = true;
}
