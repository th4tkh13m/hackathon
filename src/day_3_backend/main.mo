import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import ListTest "list";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {
  public type Custom = Custom.Custom;
  public type Animal = Animal.Animal;
  let DEPOSIT_AMOUNT : Nat =  100000000000;


  

  //challenge1
  public func fun() : async Custom{
    return {
      name = "We are DnBoiz";
      age = 20;
    };
  };

  //challenge2, 3 in animal.mo

    // Challenge4
  public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal{
    var animal : Animal = {
      specie = specie;
      energy = energy;
    };
    animal := Animal.animal_sleep(animal);
    push_animal(animal);
    return animal;
  };


  //challenge 5
  type List<Animal> = ?(Animal, List<Animal>);
  var list : List<Animal> = List.nil();

    // Challenge6
  private func push_animal(animal : Animal) : (){
      list := List.push(animal, list);
  };

  public func get_animals() : async [Animal]{
    return (List.toArray(list));
  };

  //challenge7, 8 , 9, 10 in list.mo 

  // Challenge11
  public shared({caller})  func is_anonymous() : async Bool{
    if (Principal.toText(caller) == "2vxsx-fae"){
      return true;
    };
    return false;
  };

  // Challenge12
  let numbers = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  let caller : Principal = Principal.fromText("2vxsx-fae");

  let animal : Animal = {
    specie = "Dog";
    energy = 10;
  };

  // Challenge13

  //this function is comment because it is rewrited in challenge14
  // public func add_favorite_number(n : Nat) : async Text{
  //   if (numbers.get(caller) != null) numbers.put(caller, n);

  // };
  
  public func show_favorite_number() : async ?Nat{
    numbers.get(caller)
  };

  // Challenge14
  public func add_favorite_number(n : Nat) : async Text{
    if (numbers.get(caller) != null){
      return "You've already registered your number";
    };
    numbers.put(caller, n);
    return "You've successfully registered your number";
  }; 
  

  // Challenge15
  public func update_favorite_number(n : Nat) : async Bool{
    let result = numbers.replace(caller, n);
    if (result == null){
      return false;
    };
    return true;
  };

  public func delete_favorite_number() : async Bool{
    let result = numbers.remove(caller);
    if (result == null){
      return false;
    };
    return true;
  };

  // Challenge16
  public func deposit_cycles() : async Nat{
    Cycles.accept(DEPOSIT_AMOUNT)
    // return DEPOSIT_AMOUNT;
  };

  public func available() : async Nat{
    return Cycles.balance();
  };

  //challenge17
  


};
