# Ladder -hs

## Software for managing ladder, written in Haskell

### Auto-generate AGA Ratings
Loads 2 files: AGA ratings and results list
generates properly formatted text file with ratings

Uses Parsec
(work in progress... so far basic parse of aga list into
list of records)

### Calculate Ladder Standings
Currently does calculation, but does not do IO.

### Future (May be separate software project)
- autogenerate html pages using pandoc, just from inputted results
- use database
- auto upload
- web site to allow user submissions
- AGA ratings auto generated and emailed as chron job.
