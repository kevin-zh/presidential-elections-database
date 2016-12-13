select * from Candidate;

select * from Ran where Year = 1920;


select * from Party;

select Name from Candidate;

select * from StateResult;



---QUERY ELECTION RESULTS BY YEAR (CANDIDATES)
select PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, EVotes, EVotesP, PVotes, PVotesP
from Ran R, Party PTY, Candidate P, Candidate VP where Year = 1920 and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;
---QUERY ELECTION RESULTS BY YEAR (WINNER)
select Name as ElectedPresident from Candidate C, Election E where Year = 1920 and E.WinnerCID = C.CID;


---QUERY STATE RESULTS (BY YEAR)
select PTY.PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, S.State, S.PVotes, S.PVotesP, S.EVotes 
from Ran R, Party PTY, Candidate P, Candidate VP, StateResult S where R.Year = 2016 and S.Year = R.Year and R.PID = S.PID and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;

---QUERY STATE RESULTS (BY YEAR AND STATE)
select PTY.PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, S.State, S.PVotes, S.PVotesP, S.EVotes 
from Ran R, Party PTY, Candidate P, Candidate VP, StateResult S where R.Year = 2008 and S.Year = R.Year and R.PID = S.PID and S.State = 'Maryland' and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;


