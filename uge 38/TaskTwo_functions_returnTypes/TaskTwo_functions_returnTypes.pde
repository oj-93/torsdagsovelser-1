boolean happy = true;

void setup() {
  sumOfTwoNumbers(5, 4);
  upperCase("halløj");
   if (iAmHappy())
   {
     println("I clap my hands");
   }
   else
   {
     println("I don't clap my hands"); 
   }
}

int sumOfTwoNumbers(int number1, int number2 ){
  println(number1 + number2);
  return number1 + number2;
}
String upperCase(String sentence){
  println(sentence.toUpperCase());
  return sentence.toUpperCase();
} 


boolean iAmHappy()
{
  return happy; 
  
}
