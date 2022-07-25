import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
actor {


  public func get_fib(num: Int) : async Int {
    if (num <= 1) {
      return 1;
    } else {
    return (await get_fib(num - 1)) +  (await get_fib(num - 2));}
  };

  // Challenge 1
  public func add(num1: Float, num2: Float) : async Float {
    return num1 + num2;
  };

  // Challenge 2
  public func square(num: Float) : async Float {
    return num * num;
  };

  // Challenge 3
  public func day_to_sec(n: Nat) : async Nat {
    if (n <= 0) {
      return 0;
    } else {
    return n * 24 * 3600;}
  };

  // Challenge 4
  public func increment_counter(num: Nat, n: Nat) : async Nat {
    return num + n;
  };

  public func clear_counter() : async Nat {
    return 0;
  };

  // Challenge 5
  public func divide(n: Nat, m: Nat) : async Bool {
    return n % m == 0;
  };

  // Challenge 6
  public func  is_even(n: Nat) : async Bool {
    return await(divide(n, 2));
  };

  // Challenge 7
  public func sum_array(arr: [Nat]) : async Nat {
    if (arr.size() == 0) {
      return 0;
    };
    var s : Nat = 0;

    for (value in arr.vals()) {
      s:= s + value;
    };
    return s;
  };

  // Challege 8
  public func maximum(arr: [Nat]) : async Nat {
    if (arr.size() == 0) {
      return 0;
    };
    var max : Nat = 0;

    for (value in arr.vals()) {
      if (value > max) {
        max := value;
      }
    };
    return max;
  };

  // Challenge 9
  public func remove_from_array(arr: [Nat], num: Nat) : async [Nat] {
    let theProjectsBuffer : Buffer.Buffer<Nat> = Buffer.Buffer(arr.size());
    for (value in arr.vals()) {
      if (value != num) {
          theProjectsBuffer.add(value);
      }
    };
    return theProjectsBuffer.toArray();
  };

  // Challenge 10
  public func selection_sort(arr: [Nat]) : async [Nat] {
    var new_arr : [var Nat] = Array.thaw(arr);
    var min : Nat = 0;
    var ind : Nat = 0;
    for (i in Iter.range(0, arr.size() - 1)) {
      min := new_arr[i];
      ind := i;
      for (j in Iter.range(i, arr.size() - 1)) {
        if (new_arr[j] < min) {
          min:= new_arr[j];
          ind := j;
        }
      };
      var temp : Nat = new_arr[i];
      new_arr[i] := new_arr[ind];
      new_arr[ind] := temp;
    };

    return Array.freeze(new_arr);
  }

};
