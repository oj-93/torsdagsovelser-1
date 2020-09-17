int[]arrayOfInts = new int [3];
String[]arrayOfString = new String[3];
boolean[]arrayOfBoolean = new boolean[3];
void setup() {
  arrayOfString[0] = "Stor";
  arrayOfString[1] = "Fed";
  arrayOfString[2] = "Kat";
  printsArrayAndString(arrayOfString);
  arrayOfInts[0] = 3;
  arrayOfInts[1] = 7;
  arrayOfInts[2] = 9;
  println(returnSum(arrayOfInts));
  
  
}

void printsArrayAndString (String[]value) {
  for (int i = 0; i<3; i++) {
   println(value[i]);
  }
}
int returnSum(int[]numb) {
  int sum = 0;
  for (int i = 0; i<3; i++) {
    sum += numb[i];
  }
return sum;

}
