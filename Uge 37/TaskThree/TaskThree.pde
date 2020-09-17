int redColor1 = 255;
int redColor2 = 9;
int redColor3 = 0;

int yellowColor1 = 254;
int yellowColor2 = 255;
int yellowColor3 = 0;

int greenColor1 = 0;
int greenColor2 = 255;
int greenColor3 = 74;
boolean redLight = true;
boolean yellowLight = true;
boolean greenLight = true;

void setup(){
  size(600, 600);
}

void draw(){
  frameRate(10);
  background(100);
  float radius = height*0.1;
  float x = width/2;
  float y = height/2;
  
  if (greenLight){
  fill(greenColor1,greenColor2, greenColor3);
    circle( x, y+150, radius);}
  if(keyPressed); {
  if(key == 'e' || key == 'E'){
  greenLight=!greenLight;
  }
  } 
  if (redLight){
    fill(redColor1, redColor2, redColor3);
    circle(x,y-50,radius);}
    if(keyPressed);{
      if(key == 'q' || key == 'Q'){
        redLight=!redLight;
      }
    }
    
    if(yellowLight){
      fill(yellowColor1, yellowColor2, yellowColor3);
      circle(x, y+50, radius);}
      if(keyPressed);{
        if(key == 'w' || key == 'W'){
          yellowLight=!yellowLight;
        }
      }
    
    
    
    



}
