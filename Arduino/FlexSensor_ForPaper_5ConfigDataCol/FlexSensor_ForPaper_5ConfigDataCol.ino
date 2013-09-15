int WB[5] = {428,439,348,387,344};
int WBtol[5] = {48,27,23,22,37};
double WBpriorities[5] = {7.0,3.0,3.0,5.0,2.0};

void setup() { 
  Serial.begin(9600);
} 

void loop() {
  int vals[5] = {
}

double WBPriority(int vals[5]) {
  double priority = 0.0;
  for(int i = 0; i < 5; i++) {
    priority += WBpriorities[i]*Math.abs(vals[i]-WB[i])/WPtol[i];
  }
}
