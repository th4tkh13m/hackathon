import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";

actor {

    // Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
    
      return Nat8.fromNat(n % 256);
    };

    // Challenge 2
    public func  max_number_with_n_bits(n : Nat) : async Nat {
        return Nat.pow(2, n) - 1;
    };

    // Challenge 3
    public func decimal_to_bits(n : Nat) : async Text {
        var a : Nat = n;
        var res : Text = "";
        if (n == 0) {
            return "0";
        };
        while (a != 0) {
            res := Nat.toText(a % 2) # res;
            a := a / 2;
        };
        return res;
    };
}