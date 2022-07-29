import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
    import Principal "mo:base/Principal";

shared(msg) actor class CycleInCanister() {

    let avaiable = Cycles.avaiable(); 
    let owner = msg.caller;
    let approve = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    
  public shared(msg)  func transferFrom(p: Pricipal, amount : Nat) : async () {
    assert(approve.get(p)!=null);
    assert(approve.get(p)>= amount);
    assert(avaiable>=amount);
    avaiable = avaiable - amount;
    approve.put(p, approve.get(p)!-amount);
  };

  public shared(msg) func approve(p: Pricipal, amount : Nat)
    : async () {
    assert (msg.caller == owner);
    if (approve.get(p)==null){
        approve.put(p, amount);
        }
        else{
        approve.put(p, amount + approve.get(p));
    }
  };

}