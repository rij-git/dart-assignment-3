void main() {
   // Driver
   Driver dr= Driver("Rahim", 25, "Bike");
   print(dr.getInfo());

   //Rider
   BikeRide br=BikeRide();
   br.baseFare(3.00);
   br.ratePerkilometer(1.50);
   br.ratePerMin(20,1);
   br.printFare(br, 10);



}
class Person {
  String _name="";
  int _age=0;

  Person(String name, int age, String vehicle){
      this._name=name;
      this._age= age;
  }

  String getInfo(){
    return "";
  }

}

class Driver extends Person{
  String vehicle="";

  Driver(String name, int age,String vehicle) : super(name, age,vehicle){
    this.vehicle=vehicle;
  }


  @override
  String getInfo(){
    return "Name:" + this._name + "," + "Age:" + this._age.toString() + "," + this.vehicle;
  }

}

abstract class Ride{
  double calculateFare(double distance);
  void baseFare(double baseFare);
  void ratePerkilometer(double ratePerkm);
  void ratePerMin(double totalTime,double ratePerMin);

}

class BikeRide implements Ride{

  double baseFareVal=0.0;
  double ratePerkmVal=0.0;
  double toalRatePerMinVal=0.0;
  double totalFare=0.0;

  void baseFare(double baseFare){
    this.baseFareVal= baseFare;

  }
  void ratePerkilometer(double ratePerkm){
    this.ratePerkmVal=ratePerkm;

  }

  void ratePerMin(double totalTime,double ratePerMin){
       this.toalRatePerMinVal = totalTime * ratePerMin;
  }

  double calculateFare(double distance){
    this.totalFare= (distance * this.ratePerkmVal) + this.toalRatePerMinVal + this.baseFareVal;
    return this.totalFare;
  }

  void printFare(Ride ride, double distance){
    double fareAmount = this.calculateFare(distance);
    print("Total Fare:" + fareAmount.toString());
  }
}