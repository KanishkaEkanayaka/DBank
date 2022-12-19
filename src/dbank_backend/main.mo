import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue :Float = 300; //asign 300
  //currentValue:= 300;
  //currentValue := 100;  //change value of currentValue to 100

  stable var startTime = Time.now();
  //startTime:= Time.now();
  //Debug.print(debug_show(startTime));

  let id = 124521215845; //assigning a constatnt 
  
  //Debug.print(debug_show(id));

  public func topUp(amount:Float){
   
    currentValue+=amount;
    //Debug.print(debug_show(currentValue));
   
  };

   public func withdraw(amount:Float){
    let tempValue:Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
     }
     else{
      Debug.print("insufficient balance");
     }
  };

  public query func checkBalance() :async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime; //nano seconds
    let timeElapsedS = timeElapsedNS/1000000000; //seconds

    currentValue :=currentValue * (1.01** Float.fromInt(timeElapsedS));
    startTime := currentTime; //to set the start time equals to the time last he received compound interest
  }


}