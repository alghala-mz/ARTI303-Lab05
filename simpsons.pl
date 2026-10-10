% ARTI 303 - Lab 5: Working with Rules
% The Simpsons family tree (parent(Parent, Child)).

% Facts: genders
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Facts: relationships shown in the family tree
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).

% Rules
father(F, C) :-
 parent(F, C),
 male(F).

mother(M, C) :- 
    parent(M, C), 
    female(M).

son(S, P) :- 
    parent(P, S), 
    male(S).

daughter(D, P) :- 
    parent(P, D), 
    female(D).


brother(B, S) :- 
    parent(P, B), 
    parent(P, S),
    B \= S, 
    male(B).

sister(S, X) :- 
    parent(P, S), 
    parent(P, X), 
    S \= X, 
    female(S).

grandfather(G, C) :- 
    father(G, P), 
    parent(P, C).

aunt(A, N) :- 
    sister(A, P), 
    parent(P, N).

uncle(U, N) :- 
    brother(U, P), 
    parent(P, N).

cousin(C1, C2) :- 
    parent(P1, C1), 
    parent(P2, C2), 
    parent(G, P1), 
    parent(G, P2), 
    P1 \= P2, 
    C1 \= C2.

ancestor(A, D) :- 
    parent(A, D).

ancestor(A, D) :- 
    parent(A, X), 
    ancestor(X, D).
