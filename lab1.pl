%Лабораторная работа 1
%Вариант 2

%удаление последнего элемента списка
del([P,_], [P]) :- !.
del([H|T], [H|R]) :- del(T, R).

%произведение элементов списка
mult([],1).
mult([H|T],M):-mult(T,M1),M is H*M1.

%длина списка
len([],0).
len([_|T],L):- len(T,L1), L is L1+1.

%поиск значения в списке
mem(X,[X|_]).
mem(X,[_|T]) :- mem(X,T).

%объединение списков
app([],X,X).
app([H|T],X,[H|T1]) :- app(T,X,T1).

%удаление
rem(X,[X|Tail],Tail).
rem(X,[Head|Tail],[Head|Tail1]) :- rem(X,Tail,Tail1).

%перестановки
perm([],[]).
perm(List,[X|T]) :- rem(X,List,Res), perm(Res,T).

%все подсписки списка
subl([],[]).
%subl(R,L) :- app(_,R,L1),app(L1,_,L).
subl(R,L) :- app(_,L1,L),app(R,_,L1).

%вторая реализация удаления последнего элемента
del_p([],[]):- !.
del_p(L, X):-reverse(L, [_|T]), reverse(T, X).

%предикат с использованием предиката удаления и перемножения элементов
mult_away([], 1).
mult_away([H|T],M):- del_p(T, R), mult(R, M1), M is H*M1.