import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

shared(msg) actor class CycleInCanister(available : Nat) {
    var bal = available;
    let owner = msg.caller;
    let approved = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
    
  public shared(msg) func transferFrom(p: Principal, amount : Nat) : async () {
    let t : ?Nat = approved.get(p);
    assert(t!=null);
    switch(t){
      case (null){
      };
      case (?t){
        assert(t >= amount);
        assert(available>=amount);
        bal := bal - amount;
        approved.put(p, t -amount);
      };
    };

  };

  public shared(msg) func setApprove(p: Principal, amount : Nat)
    : async () {
    assert (msg.caller == owner);
    let t : ?Nat = approved.get(p);
    switch (t){
      case (null){
        approved.put(p, amount);
      };
      case (?t){
        approved.put(p, amount + t);
      };
    };
  };
};