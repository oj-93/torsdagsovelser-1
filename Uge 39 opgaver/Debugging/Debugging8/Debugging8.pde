boolean jobsDone = true;

void setup()
{
    println(isValueGreaterThanThreshold(10, 5));
    println(isValueGreaterThanThreshold(4, 8));
    
    if (isJobDone())
    {
        println("Job's done!"); 
    }
}

boolean isValueGreaterThanThreshold(int value, int threshold){
  boolean isValueGreaterThanThreshold;
  if (value > threshold) 
    {
      isValueGreaterThanThreshold = true;
      
    } else {
            isValueGreaterThanThreshold = false;
    }
    return isValueGreaterThanThreshold;
}

boolean isJobDone()
{
    return jobsDone;    
}
