import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Hash "mo:base/Blob";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Nat16 "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

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

    // Challenge 4
    public func capitalize_character(c : Char) : async Char {
        var t : Char = c;
        if (Char.isLowercase(t)) {
            return Char.fromNat32(Char.toNat32(t) - 32);
        };
        return t;
    };

    // Challenge 7
    public func  trim_whitespace(t : Text) : async Text {
        var a : Text = t;
        return Text.trimEnd(Text.trimStart(t, #char ' '), #char ' ');
    };

    // Challenge 8
    public func duplicated_character(t: Text) : async Text{
      let hm = HashMap.HashMap<Text, Nat>(3, Text.equal, Text.hash);
      for(char in t.chars()){
        if (hm.get(Char.toText(char))==?1) return Char.toText(char);
        hm.put(Char.toText(char),1);
      };
      return t;
    };
}