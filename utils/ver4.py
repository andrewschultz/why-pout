#
# ver4.py
#
# a utility to determine which 4-word potential oronym blocks are duplicated in the source and notes files of Why Pout and Us Too
#
#todo: alphabetize cfgs, send errors to clipboard
#      add full context, allow option to open file(s) after

import sys
import os
import re
import mytools as mt

from collections import defaultdict

import i7

smart_size_detect = 5
track_bad = False
core_files_too = True
open_after = True
note_reverse = False
full_context = False # can we set this in the options file?

sort_regexes = True

totals = 0
reverses = 0

reverse_flips = []
line_dict = defaultdict(list)
so_far = defaultdict(list)

# there is some logic behind the file ordering here.
# we want to open up the most likely duplicate. It will be the last one we find as we go through the files.
# Rules 1) it's more likely Us Too copied Why Pout
#       2) the notes are the most likely file to allow dupes
#       3) the random file for WP (there is none for US, not yet) is most likely to duplicate some game-critical text somewhere, or if vice versa, the random text can be replaced
#       4) the table files and story.ni probably have equal priority, but story.ni is less likely to have dialogue. Description takes priority over dialogue.
#       5) Oronym Core is the most set in stone, and this it is added by default with core_files_too and put at the end.

my_files = [
  i7.main_src('us'), i7.main_src('wp'),
  i7.hdr('us', 'ta'), i7.hdr('us', 'de'),
  i7.hdr('wp', 'ta'), i7.hdr('wp', 'de'),
  i7.hdr('wp', 'ra'),
  i7.notes_file('us'), i7.notes_file('wp')
] # core_files boolean adds non-game-specific headers

dq = []

ver_cfg = "c:\\Users\\Andrew\\Documents\\github\\why-pout\\utils\\ver4.txt"
#utils_dir, utils_file?

with open(ver_cfg) as file:
    for (line_count, line) in enumerate (file, 1):
        if not line.startswith('#'):
            dq.extend([x.strip() for x in line.lower().strip().split(',')])
        if line.startswith(';'):
            break

# my_files.extend(glob.glob(extdir + "/*oronym*.i7x"))
if core_files_too:
    my_files = ["c:/Program Files (x86)/Inform 7/Inform7/Extensions/Andrew Schultz/Oronym Core.i7x",
    "c:/Program Files (x86)/Inform 7/Inform7/Extensions/Andrew Schultz/Spoonerism and Oronym Core.i7x"] + my_files

def usage():
    print("Combos of NSB only show certain duplication. N=notes only, S=source only, B=found in both. Default is NSB, all on.")
    print("Also s# = smart size detect. Default is", smart_size_detect) # yeah not quite true if you set it on the command line
    print("E = edit the file of ignores/exceptions", ver_cfg)
    print("RV = note reverse e.g. 3 4 1 2 matches 1 2 3 4.")
    sys.exit()

class notes_tracker():
    def __init__(self, summary, color = ''):
        self.my_array = []
        self.summary = summary
        self.color = color
        self.display = True

    def print_stuff(self):
        if not self.display:
            return
        if len(self.my_array):
            print(self.color + self.summary + mt.RESET)
            print("{} has {} instance{} flagged:".format(self.summary, len(self.my_array), mt.plur(len(self.my_array))))
            for s in self.my_array:
                print("      - " + s)
        else:
            print(self.color + "NOTHING FOR {}".format(self.summary) + mt.RESET)

def disqualified(my_string):
    for x in dq:
        if x in my_string.lower():
            return True
    return False

def process_size_stuff(my_quote, file_name, line_count):
    global reverse_flips
    s = mt.zap_comments(my_quote).split(' ')
    retval = 0
    for x in range(0, len(s) - 3):
        four_array = s[x:x+4]
        y = ' '.join(four_array)
        if smart_size_detect:
            delta = len(four_array[2]) + len(four_array[3]) - len(four_array[1]) - len(four_array[0])
            if abs(delta) > smart_size_detect:
                continue
        if y in so_far:
            retval += 1
        elif note_reverse:
            f0 = four_array[2:] + four_array[:2]
            y0 = ' '.join(f0)
            if y0 in so_far:
                if (file_name, line_count) == (so_far[y0][-1][1], so_far[y0][-1][2]):
                    pass
                elif y0 not in reverse_flips:
                    reverse_flips.append(y0)
                    mt.okay("{} cycles previous element {}.".format(y0, y))
                    mt.warn("    original: {} ({} line {})".format(so_far[y0][-1][0], i7.inform_short_name(so_far[y0][-1][1]), so_far[y0][-1][2]))
                    mt.warn("     current: {} ({} line {})".format(my_quote, i7.inform_short_name(file_name), line_count))
                    global reverses
                    reverses += 1
                    mt.add_post(file_name, line_count)
        so_far[y].append((my_quote, file_name, line_count))
    return retval

def section_disqualified(xxx):
    if xxx == 'table of main oronyms':
        return True

def needs_table(my_file):
    mf = my_file.lower()
    if 'i7x' in mf:
        return True
    return False

notes_only = notes_tracker(summary='only in notes files', color = mt.PASS)
notes_and_source = notes_tracker(summary='some notes files, some source files', color = mt.WARN)
no_notes = notes_tracker(summary='source files only', color = mt.FAIL)

cmd_count = 0

while cmd_count < len(sys.argv):
    arg = sys.argv[cmd_count].lower()
    if re.search('[nsb]', arg):
        notes_and_source.display = 'b' in arg
        notes_only.display = 'n' in arg
        no_notes.display = 's' in arg
    elif arg[0] == 's' and arg[1:].isdigit():
        smart_size_detect = int(arg[1:])
    elif arg == 'rv':
        note_reverse = True
    elif arg in ( 'rn', 'nr' ):
        note_reverse = False
    elif arg in ( 'fc', 'c', 'f' ):
        full_context = True
    elif arg in ( 'nc', 'c', 'n' ):
        full_context = False
    elif arg in ( 'rs', 'sr' ):
        sort_regexes = True
    elif arg in ( 'rsn', 'srn', 'nsr', 'nrs' ):
        sort_regexes = False
    elif arg == 'e':
        print("Opening file of exceptions", ver_cfg)
        os.system(ver_cfg)
        sys.exit()
    elif arg in ( 'no', 'on' ):
        open_after = False
    else:
        usage()
    cmd_count += 1

for this_file in my_files:
    this_rule = ''
    this_table = ''
    bnx = os.path.basename(this_file)
    this_needs_table = needs_table(this_file)
    in_source_file = 'txt' not in this_file
    quote_idx = 2 if in_source_file else 1
    with open(this_file) as file:
        for (line_count, line) in enumerate (file, 1):
            line_dict[this_file].append(line)
            if not line.strip():
                this_rule = ''
                this_table = ''
                continue
            if line.startswith('#'):
                continue
            if line.startswith('table of'):
                this_table = line.lower()
                this_table = re.sub(" *\[.*", "", this_table).strip()
                continue
            x = re.findall("this is the [^\.\?!]* rule", line)
            if x:
                this_rule = x[0]
                continue
            if in_source_file and '"' not in line:
                continue
            if this_needs_table and section_disqualified(this_table):
                continue
            quote_ary = line.lower().strip().split('"')
            if in_source_file:
                quote_ary = quote_ary[1::2]
            for quote in quote_ary:
                q = re.sub("[\.\?!]", "", quote)
                q = re.sub("\[.*?\]", "", q).strip()
                q = re.sub("[',.:;]", "", q).replace('-', ' ').replace('(', '').replace(')', '').replace('/', ' ').replace('~', ' ')
                q = re.sub(' +', ' ', q)
                if disqualified(q):
                    continue
                #print(line_count, q)
                detail = this_rule if this_rule else (this_table if this_table else 'undefined')
                temp = process_size_stuff(q, this_file, line_count)
                totals += temp

incidents = 0

for s in so_far:
    if track_bad:
        if re.search('[^a-z ]', s):
            print(s, 'line', so_far[s])
    if len(so_far[s]) == 1:
        continue
    a = [ '{} L{}'.format(i7.inform_short_name(y[1]), y[2]) for y in so_far[s] ]
    b = sum('notes' in x[1] for x in so_far[s])
    c = sum('notes' not in x[1] for x in so_far[s])
    print_string = "*{}* found in {} instances: {}".format(s, len(a), ', '.join(a))#len(so_far[s]), '/'.split(a))
    if full_context:
        for q in so_far[s]:
            print(q)
            print_string += '\n          {} / {} / {}'.format(q[0], q[1], q[2])
    incidents += 1
    if open_after:
        mt.add_post(so_far[s][-1][1], so_far[s][-1][2])
    if b and c:
        notes_and_source.my_array.append(print_string)
    elif b:
        notes_only.my_array.append(print_string)
    elif c:
        no_notes.my_array.append(print_string)

notes_only.print_stuff()
notes_and_source.print_stuff()
no_notes.print_stuff()

if not incidents:
    mt.okay("No duplicates were detected!")

if reverses:
    mt.warn("{} reverse{}".format(reverses, mt.plur(reverses)))
elif note_reverse:
    mt.okay("No reverses to weed out!")

if open_after:
    mt.open_post()
elif incidents:
    print("Run with -oa to open after. Or use the default.")
