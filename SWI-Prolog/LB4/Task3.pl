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
%
%����� � ������ ���� ������� �����.�����.���.
