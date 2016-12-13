select * from Candidate;

select * from Ran where Year = 1920;

select PartyName, P.Name as PresCandidate, VP.Name as VPCandidate, EVotes, EVotesP, PVotes, PVotesP
from Ran R, Party PTY, Candidate P, Candidate VP where Year = 1920 and R.PID=PTY.PID and R.CID=P.CID and R.VID=VP.CID;

select Name as ElectedPresident from Candidate C, Election E where Year = 1920 and E.WinnerCID = C.CID;

select * from Party;

select Name from Candidate;
