
gcd(X,0,X):-!.
gcd(_,0,_):- !,fail.
gcd(X,Y,Z):- M is  X mod Y, gcd(Y,M,Z).

mutuallySimple(X,Y):-
    gcd(X,Y,1),!, true;false.

max_list(List):-indList(List,0,0,0,IndMax),write("Index"),write(IndMax).

indList([],_,IndMax,_,CurInd):- CurInd is IndMax.
indList([H|T],Ind,IndMax,Max,CurInd):-
     sumDig(H,0,S),
     maxSumDig(S,Max,NMax),S = NMax, S < H,
     mutuallySimple(S,H),!,IndMax1 is Ind,Ind1 is Ind + 1,
     indList(T,Ind1,IndMax1,NMax,CurInd);
     Ind1 is Ind + 1,indList(T,Ind1,IndMax,Max,CurInd).


maxSumDig(X,Max,NMax):- X>Max,!,NMax is X; NMax is Max.

sumDig(0,C,C):-!.
sumDig(X,C,S):- X1 is X mod 10, C1 is C + X1, X2 is X div 10,
    sumDig(X2,C1,S).
%������ ���� �������� ������ ������ ��������'
%
listTostring([],"").
listTOstring([H|T],S):-
        listTOstring(T,SS),
        number_codes(Y,H),
        concat(Y,SS,S).


allCombinationR(List,K,L):-
     (   allCombinationRep(List,K) -> nl;true),
     open('Ch.txt', read, Str),
     read_file(Str,[],L),
     close(Str),
     write(L),
     !.

read_file(Stream,L,L2) :-
    \+ at_end_of_stream(Stream),
    read_line_to_string(Stream,X),
    read_file(Stream,[X|L],L2).
read_file(_,L,L).

%��� ������������ � ����-----------------
allCombinationRep(List,K):-
    tell('Ch.txt'),told,
    translateNumToCode(List,[],NL),
    reverse(NL,RNL),
    aCR(RNL,K,Comb),
    outFile(Comb),fail.


aCR(_,0,[]):-!.
aCR([H|T],K,[H|L]):- K1 is K - 1,aCR([H|T],K1,L).
aCR([_|T],K,L):-aCR(T,K,L).


translateNumToCode([],L,L).
translateNumToCode([H|T],L,L2):-
    number_codes(H,Y),
    translateNumToCode(T,[Y|L],L2).

outputStr_symb([],_Out):-!.
outputStr_symb([H|Tail],Out):- put(Out,H),outputStr_symb(Tail,Out).

outFile(L):-
    open('Ch.txt',append,Out),
    outputStr_symb(L,Out),put(Out,10),close(Out).
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++

outListS(List):-
    length(List,K),
    allCombinationR(List,K,L2),
    nl,
    search(L2),!.

search([]):-!.
search([H|T]):-
    string_chars(H,L),
    length(L,C),
    C>1,!,sss(L,L) -> write(H),write(---),search(T);
    search(T);
    write(H),write(---),search(T).

sss(L,[_|T]):-
    ss(L,T).

ss(_,[]):-true.
ss([H|T],[H2|T2]):-
   % number_chars(H,C),
    atom_number(H,N),
    atom_number(H2,N2),
    mutuallySimple(N,N2),!,ss(T,T2);
    false.

outFile(L,_TwiceA):-
    checkThreeA(L,0),checkTwoB(L,0),checkFile(L)->
    open('Ch.txt',append,Out),
    outputStr_symb(L,Out),put(Out,10),close(Out),write(L),nl.

aP1(_P,0,P1):-reverse(P1,L1),outFile(L1,1),!,fail.
aP1(A,N,P):-in_list_exlude(A,El,A1),N1 is N - 1,aP1(A1,N1,[El|P]).

allCombRepThreeATwoB(List,K,_ThreeA):-
    tell('Ch.txt'),
    told,
    K=6 -> (
    aCR(List,K,Comb),
        checkThreeA(Comb,0),checkTwoB(Comb,0),
              aP1(Comb,K,[]),fail).

checkThreeA([],C):- C =:=3,!,true;false.
checkThreeA([H|T],C):-
    char_code(H,X),
    X=97,!,C1 is C + 1,checkThreeA(T,C1);
    checkThreeA(T,C).

checkTwoB([],C):- C =:=2,!,true;false.
checkTwoB([H|T],C):-
     char_code(H,X),
    X=98,!,C1 is C + 1,checkTwoB(T,C1);
    checkTwoB(T,C).


in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

checkFile(List):-
     open('Ch.txt', read, Str),!,
     read_file(Str,[],L),close(Str),!,
     checkNoDubl(List,L)-> true;false.

checkNoDubl(_,[]).
checkNoDubl(L,[H|T]):-
    text_to_string(H,S),string_chars(S,X),
    noRepeatSymbol(L,X,0),!,fail;
    checkNoDubl(L,T).

noRepeatSymbol([],[_|_T],_):-true.
noRepeatSymbol([],[],C):-C<6,!,fail;true.
noRepeatSymbol([H|T],[H2|T2],C):- char_code(H,X),
    char_code(H2,X2),X=X2,!,C1 is C + 1,
               noRepeatSymbol(T,T2,C1);
               noRepeatSymbol(T,T2,C).
