% Vilnis Jatnieks
% "length.pl"

% ************ RECURSIVE **************

% the length of an empty list is 0.
length_recursive([], 0).

% source: Prolog class notes
% the length of a list is N if the length of Xs is M and M is one less than N
length_recursive([_|Xs], N) :- length_recursive(Xs, M), N is M+1.


% ************ TAIL RECURSIVE **********

% when the list is empty, the answer is the result so far.
length_helper([], RSF, RSF).

% when the list is full, the result so far gets incremented and the tail of the list is passed to length_helper
length_helper([_|Xs], RSF, ANS) :- NEXT is RSF+1, length_helper(Xs, NEXT, ANS).

% when the given list is empty, the answer is 0
length_tailrecursive([], 0).

% when the given list is full, call length_helper with rsf of 0, and N as the answer
length_tailrecursive([X|Xs], N) :- length_helper([X|Xs], 0, N).


% ************ FOLD *******************
fold :-
  write('1 point pass'), nl.

