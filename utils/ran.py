import re
import i7
import mytools as mt

my_file = i7.hdr('wp', 'ra')
needs = 0

with open(my_file) as file:
    for (line_count, line) in enumerate (file, 1):
        if line.startswith('table'):
            mt.okay('STARTING', line.strip())
            continue
        if not re.search("^[0-9]+\t\"", line):
            continue
        if 'talker1' not in line:
            continue
        l = line.strip().split('\t')[1]
        if 'nosplur' not in line:
            print(line.strip())
            needs += 1

if not needs:
    print("All needed plurals covered!")
