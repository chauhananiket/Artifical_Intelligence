% DFS Code
start1 :- loaddata1,inputdata1.

loaddata1 :- retractall(link(_,_,_)),
	     csv_read_file('F:/Study material/MTech Semester Material/Semester 3/AI/Assignments/AI-A2-Aniket_Chauhan-MT20030/RoadDistance.csv',Dataset,[functor(link)]),maplist(assert,Dataset).

inputdata1 :- write("Source : "),read(Source),
	      write("Destination : "),read(Destination),
	      retractall(goal(_)),assert(goal(Destination)),
	      dfs(Source,Destination,[],[Source],0).

dfs(_,_,_,[],_) :-  write('No path exist'),!.
dfs(Source,Destination,Explored,_,DistanceCovered) :- goal(Source),write('Total Distance : '),write(DistanceCovered),nl,
					    write('Path : '),reverse(Explored,Pathlist),
					    path1(Pathlist),write(Destination).
dfs(Source, Destination,Explored,NotExplored, DistanceCovered) :-
	[_|Tail] = NotExplored,
	link(Source,Adjacent,Distance),\+member(Adjacent,Explored),
	NewExplored = [Source|Explored],
	NewNotExplored = [Adjacent|Tail],
	Sum is DistanceCovered + Distance,
	dfs(Adjacent,Destination,NewExplored,NewNotExplored,Sum).

path1([]).
path1([H|T]) :- write(H),write(' -> '), path1(T).

% Best first search Code
start2 :- loaddata2 , inputdata2.

loaddata2 :-  retractall(link(_,_,_)),retractall(heuristics(_,_,_)),
	     csv_read_file('F:/Study material/MTech Semester Material/Semester 3/AI/Assignments/AI-A2-Aniket_Chauhan-MT20030/Heuristics.csv', Dataset1, [functor(heuristics)]),maplist(assert,Dataset1),
	     csv_read_file('F:/Study material/MTech Semester Material/Semester 3/AI/Assignments/AI-A2-Aniket_Chauhan-MT20030/RoadDistance.csv', Dataset2, [functor(link)]),maplist(assert,Dataset2).

inputdata2 :- write("Source : "),read(Source),
	      write("Destination : "),read(Destination),
	      retractall(goal(_)),assert(goal(Destination)),
	      bfs(Source,Destination,[],[Source],0).

bfs(_,_,_, [],_) :-  write('No path exist'),!.
bfs(Source,Destination,Explored,_,DistanceCovered) :- goal(Source),write('Total Distance : '),write(DistanceCovered),nl,
					              write('Path : '),reverse(Explored,Pathlist),
						      path2(Pathlist),write(Destination).
bfs(Source, Destination,Explored,NotExplored, DistanceCovered) :-
	[_|Tail] = NotExplored,
	findall(Value-Adjacent,(Source \== Adjacent, link(Source,Adjacent,_),\+member(Adjacent,Explored),
	heuristics(Adjacent,Destination,Value)),Decendents),
	append(Decendents,Tail,Open),
	keysort(Open,NewNotExplored),
	[Start|_] = NewNotExplored,
	_-Successor = Start,
	link(Source,Successor,Distance),
	NewExplore = [Source|Explored],
	Sum is DistanceCovered + Distance,
	bfs(Successor,Destination,NewExplore,NewNotExplored,Sum).

path2([]).
path2([H|T]) :- write(H),write(' ->'), path2(T).








