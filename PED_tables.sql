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

--create table StateResult(
--  SID int null,
--  WinnerCID int null
--);

create table Ran(
  Year int null,
  PID int null,
  CID int null,
  VID int null,
  EVotes int null,
  EVotesP float null,
  PVotes int null,
  PVotesP float null
);

create table StateResult(
  Year int null,
  State varchar2(50) null,
  PID int null,
  CID int null,
  PVotes int null,
  PVotesP float null,
  EVotes int null
);

