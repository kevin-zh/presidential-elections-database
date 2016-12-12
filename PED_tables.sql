create table Party(
  PID int null,
  PartyName varchar2(50) null
);

create table Candidate(
  CID int null,
  Name varchar2(50) null,
  Gender char null
);

create table Election(
  Year int null,
  WinnerCID int null
);

create table StateResult(
  SID int null,
  WinnerCID int null
);

create table Ran(
  Year int null,
  CID int null,
  PID int null,
  Votes int null,
  VotesP float null,
  EVotes int null,
  EvotesP float null
);

