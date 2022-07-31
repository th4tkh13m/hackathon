import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import ListTest "list";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {
  stable let numbers = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);


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
}