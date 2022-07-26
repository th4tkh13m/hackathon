actor {
    import Custom "custom";
import Animal "animal";
import List "mo:base/List";

actor {
  public type Custom = Custom.Custom;
  public type Animal = Animal.Animal;
  type List<Animal> = ?(Animal, List<Animal>);
  var list : List<Animal> = List.nil();

  let animal : Animal = {
    specie = "Dog";
    energy = 10;
  };

  public func fun() : async Custom{
    return {
      name = "VVD";
      age = 19;
    };
  };

  private func push_animal(animal : Animal) : (){
      list := List.push(animal, list);
  };

  public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal{
    var animal : Animal = {
      specie = specie;
      energy = energy;
    };
    animal := Animal.animal_sleep(animal);
    push_animal(animal);
    return animal;
  };

  public func get_animals() : async [Animal]{
    return (List.toArray(list));
  };
};
}