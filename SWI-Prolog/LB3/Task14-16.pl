in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

sprava_next(_A,_B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_A,_B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).


%�������14
%�������� ���� ������: ���������, �����, ������.
%������ ������ ����������: ����������, ��� ���� �� ��� �������, ������ ������,
%������ - �����, �� �� � ���� ���� ����� �� ������������� �������. �����
%���� ����� � ������� �� ������?

pr_commun:- Friends=[_,_,_],

el_no(Friends,1,[blond,_]),
el_no(Friends,2,[brunt,_]),
el_no(Friends,3,[orange,_]),

in_list(Friends,[_,rishow]),
in_list(Friends,[_,below]),
in_list(Friends,[_,chernov]),
    (in_list(Friends,[blond,rishow]);
                in_list(Friends,[blond,chernov])),
    (in_list(Friends,[brunt,rishow]);
                in_list(Friends,[brunt,below])),
    (in_list(Friends,[orange,below]);
                in_list(Friends,[orange,chernov])),
write(Friends).



%������� �15
%��� ������� ����� � �����, ������� � ����� ������� �
%������. ��������, ��� ������ � ��� ����� ������ � ������ ���������. ��
%�����,�� ������ ���� �� ���� ������. ������ ���� � ������� ������. ����������
%����� ������ � ������ �� ������ �� ������.


��_����:- ������� =[_,_,_],
           in_list(�������,[������,_,����]),
            in_list(�������,[_,����,_]),
             in_list(�������,[_,����,_]),
              in_list(�������,[_,����,_]),
               in_list(�������,[_,_,����]),
                in_list(�������,[_,_,����]),
                 in_list(�������,[_,_,����]),
            (   in_list(�������,[���,����,����]);
                in_list(�������,[���,����,����])),
            (   in_list(�������,[������,����,_]);
                in_list(�������,[������,����,_])),
            (   in_list(�������,[������,_,����]);
                in_list(�������,[������,_,����])),
            write(�������).

%Misiion 16
% �� ������ �������� ��� �����: �������, ������ � �������. ��
% ������� �������, ������ � �������. � ������� ��� �� �������, �� ������.
% �� ����� ������� �� ������. �������, ������� �� ������ ��������,
% ������ ������. ������� ������� �������, ������ � ��������.
%
��_�����:- ������ =[_,_,_],
           in_list(������,[������,_,_,_]),
            in_list(������,[�������,_,_,_]),
             in_list(������,[�������,_,_,_]),
              in_list(������,[_,����,_,1]),
               in_list(������,[_,����,_,_]),
                in_list(������,[_,����,_,_]),
                in_list(������,[������,WHO1,2,1]),
in_list(������,[�������,WHO2,3,0]),
                in_list(������,[�������,WHO3,1,_]),
write(������),nl,

write(WHO1),nl,write(WHO2),nl,write(WHO3).

%������� 17 � �������, �������, ������� � ����� ��������� ������,
% �������, ���� � ����. ��������, ��� ���� � ������ �� � �������, ����� �
% ��������� ��������� ����� �������� � ������� � ������, � ����� - ��
% ������� � �� ����. ������ ��������� ����� ����� � ������ � �������.
%��� ������������ ��� �������� �� �������.

��_�������:- ������� =[_,_,_,_],
              in_list(�������,[����,_]),
              in_list(�������,[������,_]),
              in_list(�������,[����,_]),
              in_list(�������,[�������,_]),
               in_list(�������,[_,������]),
               in_list(�������,[_,������]),
               in_list(�������,[_,�����]),
               in_list(�������,[_,�������]),

           (   in_list(�������,[����,������]);
                in_list(�������,[����,������]);
                in_list(�������,[����,�����])),
            (   in_list(�������,[������,������]);
                in_list(�������,[������,������]);
                in_list(�������,[������,�����])),

            (   sprava_next([�������,_],[_,������],�������);
                sleva_next([�������,_],[_,������],�������)),
            (   sleva_next([�������,_],[����,_],�������);
                sprava_next([�������,_],[����,_],�������)),
            (   in_list(�������,[������,�����]);
                in_list(�������,[����,�����])),
            (   sprava_next([_,������],[_,�����],�������);
                sleva_next([_,������],[_,�����],�������)),
            (   sleva_next([_,������],[������,_],�������);
                sprava_next([_,������],[������,_],�������)),
            write(�������).
%������� 18 �������, ������, �������� � �������.
%���� �� ��� ������, ������ ��������, ������-�����,� ���������-��������.
%� ��� �������� ���������: ������� � ��������
% ������ � ���� ������������� � ��� �����, ����� ����� ����������� �
% ������� ��������. ������ � �������� ������ ���������� ���������.
% �������� ������� �������������� ������� � �������� � ���������� �������� � ��������. ������� ������� �� ������ � ��������. ��� ��� ����������?

��_�������:- ������� =[_,_,_,_],
              in_list(�������,[�������,_]),
              in_list(�������,[������,_]),
              in_list(�������,[��������,_]),
              in_list(�������,[�������,_]),
                %el_no(�������,3,[_,_]),
                (   in_list(�������,[�������,������]);
                in_list(�������,[�������,�����]);
                in_list(�������,[�������,��������])),
                (   in_list(�������,[�������,������]);
                in_list(�������,[�������,�����]);
                in_list(�������,[�������,��������])),


           (   sprava_next([�������,_],[_,�����],�������);
                sleva_next([�������,_],[_,�����],�������)),
            (   sprava_next([��������,_],[_,�����],�������);
                sleva_next([��������,_],[_,�����],�������)),

            (   (sleva_next([������,_],[_,��������],�������);
                sprava_next([������,_],[_,��������],�������)),
            (sleva_next([������,_],[_,��������],�������);
                sprava_next([������,_],[_,��������],�������))),

             (   (sleva_next([�������,_],[�������,_],�������);
                sprava_next([�������,_],[�������,_],�������));
            (sleva_next([�������,_],[������,_],�������);
                sprava_next([�������,_],[������,_],�������))),
            write(�������).

% ������� 19 ��� ����� ������ ������, ������, ������ ����.
% ������ ������ ��������������, ����� �� ��-�������, � ����� ��� ���������� ������.
% ����� ������������ ��������� � ������ �����, ��� ����������.
% ������������ ������ ������ ����� ����������.
% ����� � ������ ����� ������ �����.
%��� �������� ������������? ����� ������� ���������� ������?

��_�����_���_������:- ������� =[_,_,_],
           in_list(�������,[�����,���������,���������]),
            in_list(�������,[������,������,�������]),
              in_list(�������,[_,_,�������]),
              in_list(�������,[_,������,_]),



                el_no(�������,1,[_,������,_]),

                in_list(�������,[WHO1,_,���������]),
in_list(�������,[������,WHO2,_]),

write(�������),nl,

write(WHO1),nl,write(WHO2).

%������� 1
% ���������, �����(�����), ��������(�����) � ����������(�����).
% ��������, �������, ������������ � ��������.
% ���������, ��� ������ �� ��� ���� � ����� ����� ���������� ����� �� ����������.
%�������� � ������� ���������� � ������ �������������� ����������� �������.
% ���� ����� �����, ������� � ����� ������� �������, ����������� ����
% �����, ������� ��� �� ������� � ������ �� ����� �� ����������.
% ������� ����� ���� �� ������������ ���������. ����� �� ���������� ��
% ����� ���� �����. ��� ����� ������ �� ���, ��� ��� ���?

reverseList(List,NewList):- rev(List,[],NewList).
rev([],Copy,Copy):- !.
rev([Head|Tail],Copy,NewList):-
    rev(Tail,[Head|Copy],NewList).

in_listO([],_,_,L2,L2).
in_listO([El|T],El,El1,L2,K):-
    replace(�������,��������,El,[],L),
    reverseList(L,NL),
    in_listO(T,El,El1,[NL|L2],K).
in_listO([El1|T],El,El1,L2,K):-
    replace(��������,�������,El1,[],L),
    reverseList(L,NL),
    in_listO(T,El,El1,[NL|L2],K).
in_listO([A|T],El,El1,L2,K):- in_listO(T,El,El1,[A|L2],K).

replace(_, _, [], L2,L2).
replace(O, R, [H|T], L2,L3) :- H = O -> replace(O, R, T, [R|L2],L3);
                           replace(O, R, T, [H|L2],L3).


��_����:- ��� =[_,_,_,_],
              in_list(���,[����,�����,_]),
              in_list(���,[�������,�����,_]),
              in_list(���,[��������,�����,_]),
             in_list(���,[���������,����������,_]) ,

                (   in_list(���,[���������,����������,_]);
                  in_list(���,[���������,�����,_]);
                  in_list(���,[���������,�����,_]) ),
              in_list(���,[_,_,������������]),
              in_list(���,[_,_,��������]),

              (                       (in_list(���,[_,����������,�������]),
					(in_list(���,[_,�����,��������]);
					in_list(���,[_,�����,��������]);
					in_list(���,[_,�����,��������])));

                                       (in_list(���,[_,�����,�������]),
					(in_list(���,[_,����������,��������]);
					in_list(���,[_,�����,��������]);
					in_list(���,[_,�����,��������])));

                                       (in_list(���,[_,�����,�������]),
					(in_list(���,[_,�����,��������]);
					in_list(���,[_,����������,��������]);
					in_list(���,[_,�����,��������])));

                                       (in_list(���,[_,�����,�������]),
					(in_list(���,[_,�����,��������]);
					in_list(���,[_,�����,��������]);
					in_list(���,[_,����������,��������])))),

              (in_listO(���,[_,_,�������],[_,_,��������],[],����)),

    write(����).


%��� ������������� ������. ������� ������� ���������, �������
%������ ������ ������ ������, � ���������� ����� �����.
%
%
lengthList(List,L):- lengthList(List,0,L).
lengthList([],C,L):- L is C,!.
lengthList([_Head|Tail],Count,L):-
    Count1 is Count +1,
    lengthList(Tail,Count1,L).

ielm(H,[S|_T]):-H<S.

indElmLL(S,Count):-
    reverseList(S,L),
    lengthList(L,Lg),
    indexElmLessLefth(L,0,0,Count,Lg).
indexElmLessLefth([],_,Count,Count,_):-!.
indexElmLessLefth([H|T],Ind,C,Count,Lg):-
    ielm(H,T) -> C1 is C + 1,Lg1 is Lg - 1 - Ind,write(Lg1),Ind1 is Ind+1,
                        indexElmLessLefth(T,Ind1,C1,Count,Lg);
                        Ind1 is Ind + 1,
                        indexElmLessLefth(T,Ind1,C,Count,Lg).

%1.43 ��� ������������� ������. ���������� ����� ���������� ����-
%������� ���������.
minList([H],H):-!.
minList([Head|Tail],Min):-
    minList(Tail,MinElm),
    MinElm < Head,!, Min=MinElm;
    Min = Head.

countMin(S,Count):-
    minList(S,Min),
    countMin(S,Min,0,Count).

countMin([],_,C,C):-!.
countMin([Min|T],Min,C,Count):- C1 is C + 1,countMin(T,Min,C1,Count).
countMin([_|T],Min,C,Count):-countMin(T,Min,C,Count).

%
