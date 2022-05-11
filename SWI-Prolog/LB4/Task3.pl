%1 ���� ������. ���������� ����� ����� ���������� ������� ��������.
%

countSymb([],CurC,CurC).
countSymb([H|T],CurC,C):-
    char_code(H,X),
    X @>= 1040,X @=< 1103,!,C1 is CurC+1,countSymb(T,C1,C);
    countSymb(T,CurC,C).

commonCountRus(S,X):-
    string_chars(S,C),
    countSymb(C,0,X).

%���� ������. ���������� ��������� �������� �� �������� ������� �������� ���������.
%

isLowercaseStr([]).
isLowercaseStr([H|T]):-
    char_code(H,X),
    ((X @>=1074,X @=<1103);(X @>=97, X @=<122)),!,isLowercaseStr(T);
    fail.

palind([],L,L).
palind([H|T],L,L1):-palind(T,[H|L],L1).

equalList([],[]).
equalList([H|T],[E|R]):-
    H=E,!,equalList(T,R);
    fail.

isPallindrom(S):-
    string_chars(S,C),
    isLowercaseStr(C),!,palind(C,[],NL),equalList(C,NL);
    write('� ������ ���� ������ �������(��� �� ��������').

%����� � ������ ���� ������� �����.�����.���.
