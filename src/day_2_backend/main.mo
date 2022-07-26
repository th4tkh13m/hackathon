import Nat "mo:base/Int8";
import Nat8 "mo:base/Nat8";

actor {

    // Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
      return Nat8.fromNat(n);
    };
}