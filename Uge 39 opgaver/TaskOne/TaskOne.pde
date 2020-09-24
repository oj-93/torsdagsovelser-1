int myArray[] = { 8, 9, 1, 5, 11, 13, 7, 4, 6, 3, 12, 10, 2 }; //<>//

void setup() {
  int i=0;
  while (i < myArray.length) {
    i++;
    sortArray();
  }
  println(myArray);
}

void sortArray() {
  for (int i=0; i < myArray.length - 1; i++) {
    if (myArray[i] > myArray[i + 1]) {
      swap(myArray, i,i+1);
    }
  }
}

void swap (int [] refArray, int aj, int aj1) {
  int temp = refArray[aj];
  refArray[aj] = refArray[aj1] ;
  refArray[aj1] = temp; 
}
