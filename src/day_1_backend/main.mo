import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Buffer "mo:base/Buffer";
actor {


  public func get_fib(num: Int) : async Int {
    if (num <= 1) {
      return 1;
    } else {
    return (await get_fib(num - 1)) +  (await get_fib(num - 2));}
  };

  public func add(num1: Float, num2: Float) : async Float {
    return num1 + num2;
  };

  public func square(num: Float) : async Float {
    return num * num;
  };

  public func day_to_sec(n: Nat) : async Nat {
    if (n <= 0) {
      return 0;
    } else {
    return n * 24 * 3600;}
  };

  public func increment_counter(num: Nat, n: Nat) : async Nat {
    return num + n;
  };

  public func clear_counter() : async Nat {
    return 0;
  };

  public func divide(n: Nat, m: Nat) : async Bool {
    return n % m == 0;
  };

  public func  is_even(n: Nat) : async Bool {
    return await(divide(n, 2));
  };

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

  public func remove_from_array(arr: [Nat], num: Nat) : async [Nat] {
    let theProjectsBuffer : Buffer.Buffer<Nat> = Buffer.Buffer(arr.size());
    for (value in arr.vals()) {
      if (value != num) {
          theProjectsBuffer.add(value);
      }
    };
    return theProjectsBuffer.toArray();
  };

};
