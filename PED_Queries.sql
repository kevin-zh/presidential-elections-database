select * from Candidate;

select * from Ran where Year = 1920;


select * from Party;

select Name from Candidate;

select * from StateResult;






---QUERY STATE RESULTS (BY YEAR)
select PTY.PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, S.State, S.PVotes, S.PVotesP, S.EVotes 
from Ran R, Party PTY, Candidate P, Candidate VP, StateResult S
where R.Year = 2016 and S.Year = R.Year and R.PID = S.PID and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;

---QUERY STATE RESULTS (BY YEAR AND STATE)
select PTY.PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, S.State, S.PVotes, S.PVotesP, S.EVotes 
from Ran R, Party PTY, Candidate P, Candidate VP, StateResult S
where R.Year = 2000 and S.Year = R.Year and R.PID = S.PID and S.State = 'Maryland' and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;

---


------------------------REQUIRED QUERIES
---QUERY FOR A GIVEN ELECTION YEAR (CANDIDATES)
select PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, EVotes, EVotesP, PVotes, PVotesP
from Ran R, Party PTY, Candidate P, Candidate VP
where Year = 1920 and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;
---QUERY FOR A GIVEN ELECTION YEAR (WINNER)
select Name as ElectedPresident
from Candidate C, Election E
where Year = 1920 and E.WinnerCID = C.CID;

--QUERY FOR A GIVEN PRESIDENT/CANDIDATE
select R.Year, PartyName, VP.Name as RunningMate, Winner.Name as Winner
from Candidate P, Candidate VP, Candidate Winner, Election E, Ran R, Party PTY
where P.Name = 'Franklin D. Roosevelt' and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID and E.WINNERCID=Winner.CID and E.Year = R.Year;

--QUERY FOR RE-ELECTED ON NON-CONTIGUOUS TIMES
select P.Name, E.Year as Elected, E2.Year as Defeated, E3.Year as Re_Elected
from Candidate P, Election E, Election E2, Election E3
where E.Year<E2.Year and E2.Year<E3.Year and E.WINNERCID=P.CID and E3.WINNERCID=P.CID and E2.WINNERCID!=P.CID;

--SWING CANDIDATES
select distinct P.Name, R.Year, PartyName, VP.Name as RunningMate, Winner.Name as Winner
from Candidate P, Candidate VP, Candidate Winner, Election E, Ran R, Ran R2, Party PTY
where R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID and E.WINNERCID=Winner.CID and E.Year = R.Year and R2.CID=P.CID and R2.Year!=R.Year and R2.PID!=R.PID
order by P.Name;

--PARTY HISTORICAL QUERY
select PartyName, R.Year, C.name as PRESCANDIDATE, VP.name as VPCANDIDATE, R.EVOTES, R.EVOTESP,
(case when E.WINNERCID = C.CID then 'WON' else 'DEFEATED' end) as RESULT
from Party P, Ran R, Candidate C, Candidate VP, Election E
where PartyName='Democratic' and R.PID=P.PID and R.CID=C.CID and R.VID=VP.CID and R.Year = E.Year;