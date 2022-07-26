import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Hash "mo:base/Blob";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
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

    //challenge 5
  public func capitalize_text(c: Text) : async Text {
    var t : Char = ' ';
    var a : Text = "";

    for(temp in c.chars()){
      t := await capitalize_character(temp);
      a #= Char.toText(t);
    };
    return a;
  };

    //challenge 6
  public func is_inside_string(s: Text, c: Char) : async Bool {
      let t : Char = c;
      for(temp in s.chars()){
        if (Char.equal(t,temp)) return true;
    };
    return false;
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

    // Challenge 9
    public func  size_in_bytes(text: Text) : async Nat {
      var a : Nat = 0;
      for (char in text.chars()) {
        a := a + (Text.encodeUtf8(Char.toText(char)).size());
      };
      return a;
    };

    // Challenge 10
    public func bubble_sort(arr: [Nat]) : async [Nat] {
      var is_sorted : Bool = false;
      var new_arr : [var Nat] = Array.thaw(arr);
      while (not is_sorted) {
        is_sorted := true;
        for (i in Iter.range(0, arr.size() - 2)) {
          if (new_arr[i] > new_arr[i + 1]) {
            is_sorted := false;
            var temp : Nat = new_arr[i + 1];
            new_arr[i + 1] := new_arr[i];
            new_arr[i] := temp;
          }
        };
      };
      return Array.freeze(new_arr);
    };

    //challenge 11
  public func  nat_opt_to_nat(n: ?Nat, m: Nat): async Nat{
    switch(n){
          // Case where n is null
          case(null) {
              return (m);
          };
          // Case where n is a nat
          case(?n){
              return (n);
          };
      };
  }; 
  
  //challenge 12
  public func day_of_the_week(n: Nat) : async ?Text {
    do ? {
      switch n {
        case (1) { "Monday" };
        case (2) { "Tuesday" };
        case (3) { "Wednesday" };
        case (4) { "Thursday" };
        case (5) { "Friday" };
        case (6) { "Saturday" };
        case (7) { "Sunday" };
        case (_) { null!};
      };
    };
  };

  //challenge 13
  let f = func (n : ?Nat) : Nat {
        switch(n){
          // Case where n is null
          case(null) {
              return (0);
          };
          // Case where n is a nat
          case(?n){
              return (n);
          };
      };
    };
  public func populate_array(a: [?Nat]) : async [Nat]{
    return Array.map<?Nat,Nat>(a,f);
  }; 

    // Challenge 14
  public func sum_of_array(a : [Nat]) : async Nat{
    let iter = Iter.fromArray(a);
    var sum = 0;
    Iter.iterate<Nat>(iter, func(x, _index) {
      sum += x;
    });
    return sum;
  };

  //challenge 15
  
  public func squared_array(a: [Nat]) : async [Nat]{
    let f15 = func (n : Nat) : Nat {
      return n*n;
    };
    return Array.map<Nat,Nat>(a,f15);
  };

    // Challenge 16
    public func increase_by_index(a : [Nat]) : async [Nat]{
    return (Array.tabulate<Nat>(a.size(), func (i : Nat) : Nat{
      return (a[i] + i);
    }));
  };

    // Challenge17
  func contains<A>(eqA : (A, A) -> Bool, element : A, list : [A]) : async Bool{
    for (nat in list.vals()){
      if(eqA(nat, element) == true){
          return true;
      };
    };
    return false;
  };

  // public func test() : async Bool{
  //   let list = ["a", "b", "c"];
  //   let a = "d";
  //   let eqA = func(x : Text, y : Text) : Bool{
  //     return (x==y);
  //   };
  //   await contains(eqA, a, list);
  // };
}