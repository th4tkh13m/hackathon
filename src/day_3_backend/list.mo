module{
    public type List<T> = ?(T, List<T>);

    // Challegen7
    public func is_null<T>(list : List<T>) : Bool{
        switch(list){
            case (null){
                return true;
            };
            case(_){
                return false;
            };
        };
    };

    // Challegen8
    public func last<T>(list : List<T>) : ?T{
        switch(list){
            case (null){
                return null;
            };
            case (?(x,null)){
                return ?x;
            };
            case(?(_, list)){
                return (last<T>(list));
            };
        };
    };

    // Challegen9
    public func size<T>(list : List<T>) : Nat{
        var count = 0;
        var newList = list;
        while(is_null<T>(newList) == false){
            switch (newList){
                case null {return count;};
                case (?(last, null)) {return count + 1;};
                case (?(_, r)){
                    newList := r;
                    count := count + 1;
                };
            };
        };
        return count;
    };

    // Challegen10
    public func get<T>(list : List<T>, n : Nat) : ?T{
        switch(list){
            case null{null};
            case (?(x, r)){
                if(n == 0){
                    return ?x;
                }else{
                    return (get<T>(r, n - 1));
                };
            };
        }
    };
};