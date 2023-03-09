% Creating facts for dynamic assertion
dynamic(approach/1).
dynamic(theorydomain/1).
dynamic(domain/1).
dynamic(aidomain/1).
dynamic(exper/1).
dynamic(probability/1).
dynamic(bio/1).
% dynamic(/1).

% Read facts file 
readfile:- consult("/content/drive/MyDrive/Projects/AI_Assignments/Assignment_5/userinput.txt").

% Call subject fact based on user input 
suggest_electives(Elective) :- readfile , subject(Elective).

% Subjects and matching facts
subject("alg"):-
  approach(theory),
  theorydomain(algo).

subject("ssh"):-
  approach(theory),
  theorydomain(socialscience).

subject("subbio"):-
  approach(theory),
  theorydomain(compbiology).

subject("mathematics"):-
  approach(theory),
  theorydomain(maths).

subject("robot"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(robotics).

subject("dl"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(machinelearning),
  exper(more2).

subject("beginmlyesbioyes"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(machinelearning),
  exper(less2),
  probability(yes),
  bio(yes).

subject("beginmlyesbiono"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(machinelearning),
  exper(less2),
  probability(yes),
  bio(no).

subject("beginmlno"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(machinelearning),
  exper(less2),
  probability(no).

subject("cvboiyes"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(computervision),
  bio(yes).

subject("cvboino"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(computervision),
  bio(no).

subject("nlp"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(naturallanguage).

subject("sml"):-
  approach(practical),
  domain(artificalintelligence),
  aidomain(statisticalml).

subject("dbms"):-
  approach(practical),
  domain(database).

subject("is"):-
  approach(practical),
  domain(infosec).

subject("mc"):-
  approach(practical),
  domain(mobilecomp).







