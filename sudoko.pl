:- use_module(library(clpfd)).
:- use_module(library(lists)).

sudoko(Rowes) :-
    length(Rowes, 9),
    maplist(same_length(Rowes), Rowes),
    append(Rowes, Board),
    Board ins 1..9,
    
    maplist(all_distinct, Rowes),
    transpose(Rowes, Columns),
    maplist(all_distinct, Columns),

    Rowes = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    squares(As, Bs, Cs),
    squares(Ds, Es, Fs),
    squares(Gs, Hs, Is),

    maplist(label, Rowes),
    maplist(portray_clause, Rowes).

    squares([], [], []).
    squares([E1,E2,E3|Es1],
            [E4,E5,E6|Es2],
            [E7,E8,E9|Es3]) :-
             all_distinct([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
             squares(Es1, Es2, Es3).
    
   



