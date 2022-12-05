search(["(", name(k,*(any)), "=", name(v,*(any)), ")"]
,"(age=23) and (position=straight)", 
Res)




["(", name(k,*(any)), "=", name(v,*(any)), ")"]

"("
OR
name(k,*(any))
OR
= 
or
name(v,*(any))
or 
)

[''="(age=23) and (position=straight)", k="age=23) and (position", v="straight"]


nfa_search([s0 = step(s1), s1 = epsilon([], [s0, s2])), s2 = success], "hello", Res).
nfa_search([s0 = step(s1), s1 = epsilon([], [s0, s2]), s2 = success],"hello", Res).


nfa_search([s0 = step([(108 -> s1), (101 -> s1)]), s1 = epsilon([], [s0, s2]), s2 = success], "hello", Res).



---------
Step(accept_char, State) :- NextState IF match accept_char 
Step(State) :- NextState

s0 = step(["a" -> S1], ["b" -> S0])


search(["(", name(k,*(any)), "=", name(v,*(any)), ")"], "(age=23) and (position=straight)", Res)

## IMPORTANT SHIT
- in s1 not S1

## Stuff to include in the rapport
- 

## Test Function 

to check for success
nfa_search([S0 = step(S0)], "hello", Res).

to check normal step excecution
nfa_search([S0 = step(s1), s1 = success], "h", Res).

nfa_search([s0 = step([('a' -> s1), ('b' -> s0)]), s1 = success], "aab", Res).


----------------------------

nfa_search([s0 = step([('a' -> s1), ('b' -> s0)]), s1 = success], "aab", Res).

1. Detection de *step* patern match
2. 

% nfa_handle_step(+Step, +String, -State, -Tail)
nfa_handle_step(
    Step: [('a' -> s1), ('b' -> s0)])],
    String: bab, 
    state: unknown_for_now,
    tail: unknown_for_now
    )

nfa_handle_step 
- Cas ou step(s1)
    > nfa_handle_step(Step, [Char | Tail], Step, Tail).
    retourner a l'appel: 
        - State: step where we are now
        - Tail: what is left AKA what we didnt eat
- Cas ou le array
    > nfa_handle_step(
        [(Cond, StateToBe)| Rest],
        [Char | Str],
        State, Tail)
    if Cond == Char:
        State = StateToBe
        Tail = Str
    else: 
        nfa_handle_step(Rest, [Char | Str], )
        


a
s0 = step(s1)
s0 = step(ANY, s1)


