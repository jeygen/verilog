/*
   Deterministic behavior: The result of a pure function is purely determined by its input arguments. Given the same inputs, it will always produce the same output.

    No Side Effects: Pure functions cannot have any side effects. That is, they cannot modify any global or class scope data, and they cannot read from or write to any file.

    Constraints and Assertions: Pure functions can be called within constraints and assertions, while non-pure functions cannot.

    No Time-consuming Operations: Pure functions cannot contain any delay statements, event triggers or any other statements that consume simulation time.

    Access to Class Properties: In the context of a class, a pure function can access properties (variables) of the class as long as these are used as read-only.
*/

// Pure are like functional programming, stateless and no side-effects
class MyClass;
    int data;

    function pure int add (int a, int b);
        return a + b;
    endfunction

    // Still pure as data isn't being modified
    function pure int add_data (int a);
        return a + data;
    endfunction
endclass

