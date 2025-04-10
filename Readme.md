# Find blunders in (fishtest) pgn data

Given a set of .pgn(.gz) files with engine evaluations, find for each the final
blunder from a clearly winning position.

Example usage:

```
> ./blundersieve --file fishtest_stalemates_202309_202504.pgn.gz
Found 1 .pgn(.gz) files in total.
Found 1 .pgn(.gz) files, creating 1 chunks for processing.
Processed 1 files
Saved 21783 unique blunders from 38791 games to blundersieve.epd.
Total time for processing: 2.112 s
```

```
Usage: ./blundersieve [options]
Options:
  --file <path>         Path to .pgn(.gz) file
  --dir <path>          Path to directory containing .pgn(.gz) files (default: pgns)
  -r                    Search for .pgn(.gz) files recursively in subdirectories
  --allowDuplicates     Allow duplicate directories for test pgns
  --concurrency <N>     Number of concurrent threads to use (default: maximum)
  --matchRev <regex>    Filter data based on revision SHA in metadata
  --matchEngine <regex> Filter data based on engine name in pgns, defaults to matchRev if given
  --matchTC <regex>     Filter data based on time control in metadata
  --matchThreads <N>    Filter data based on used threads in metadata
  --matchBook <regex>   Filter data based on book name
  --matchBookInvert     Invert the filter
  -o <path>             Path to output epd file (default: matesieve.epd)
  --evalBefore <cp>     Evaluation in cp before blunder. (default: 200)
  --evalAfter <cp>      Evaluation in cp after blunder. (default: 50)
  --help                Print this help message
```

The code is based on [matesieve](https://github.com/robertnurnberg/matesieve).
