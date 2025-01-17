%��� ������������� ������. ���������� ���������� ��������,
%������������� �� ������������, � ����� �������.
minList([H],H):-!.
minList([Head|Tail],Min):-
    minList(Tail,MinElm),
    MinElm < Head,!, Min=MinElm;
    Min = Head.

indexMinList(List,Y):- minList(List,Min), indexMinList(List,Min,0,0,Y).
indexMinList([],_Min,Count1,_,Count1):-!.
indexMinList([Head|Tail],Min,Count1,Count2,Index):-
    Head=:=Min,!,Count is Count1+Count2,indexMinList(Tail,Min,Count,1,Index);
    Count is Count2+1,indexMinList(Tail,Min,Count1,Count,Index).

reverseList(List,NewList):- rev(List,[],NewList).
rev([],Copy,Copy):- !.
rev([Head|Tail],Copy,NewList):-
    rev(Tail,[Head|Copy],NewList).

locateElmBeforeMin_AfterMin(List,List2):-
    indexMinList(List,I),
    locateElmBeforeMin_AfterMin(List,I,0,[],[],[],List2),!.
locateElmBeforeMin_AfterMin([],IMin,CurInd,SecL,FirsL,NewL,List):-
    locateElmBeforeMin_After([],IMin,CurInd,SecL,FirsL,NewL,List).
locateElmBeforeMin_AfterMin([Head|Tail],IMin,CurInd,BeforeMinL,AfterMinL,NewL,L):-
    IMin>CurInd,!,CurInd1 is CurInd +1,
    locateElmBeforeMin_AfterMin(Tail,IMin,CurInd1,[Head|BeforeMinL],AfterMinL,NewL,L);
    locateElmBeforeMin_AfterMin(Tail,IMin,CurInd,BeforeMinL,[Head|AfterMinL],NewL,L).

locateElmBeforeMin_After([],IMin,CurInd,[Head|Tail],L2,NewL,List2):-
    locateElmBeforeMin_After([],IMin,CurInd,Tail,L2,[Head|NewL],List2).
locateElmBeforeMin_After([],IMin,CurInd,[],[Head|Tail],NewL,List2):-
    locateElmBeforeMin_After([],IMin,CurInd,[],Tail,[Head|NewL],List2).
locateElmBeforeMin_After([],_IMin,_CurInd,[],[],NewL,NewL):-!.

