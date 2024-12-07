#
# ver4.py
#
# a utility to determine which 4-word potential oronym blocks are duplicated in the source and notes files of Why Pout and Us Too
#

import sys
import os
import re
import mytools as mt

from collections import defaultdict

import i7

smart_size_detect = True
track_bad = False
core_files_too = True

totals = 0

so_far = defaultdict(list)

my_files = [ i7.main_src('wp'), i7.hdr('wp', 'ta'), i7.hdr('wp', 'ra'), i7.hdr('wp', 'de'), i7.notes_file('wp'), i7.notes_file('us') ]

# my_files.extend(glob.glob(extdir + "/*oronym*.i7x"))
if core_files_too:
    my_files.extend(["c:/Program Files (x86)/Inform 7/Inform7/Extensions/Andrew Schultz/Oronym Core.i7x",
    "c:/Program Files (x86)/Inform 7/Inform7/Extensions/Andrew Schultz/Spoonerism and Oronym Core.i7x"])

dq = [ '[b]note', 'can only go', 'went up', 'you cant', 'you dont', 'you already', 'you can ', 'you want', 'you know' ]

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

def process_size_stuff(my_quote, line_sig):
    s = my_quote.split(' ')
    retval = 0
    for x in range(0, len(s) - 3):
        four_array = s[x:x+4]
        y = ' '.join(four_array)
        #print(y)
        if smart_size_detect:
            delta = len(four_array[2]) + len(four_array[3]) - len(four_array[1]) - len(four_array[0])
            if abs(delta) > smart_size_detect:
                continue
        if y in so_far:
            #print("Duplicate", y, "line", line_sig, "duplicates", so_far[y])
            retval += 1
        so_far[y].append(line_sig)
    return retval

def section_disqualified(xxx):
    if xxx == 'table of main oronyms':
        return True

def needs_table(my_file):
    mf = my_file.lower()
    if 'i7x' in mf:
        return True
    return False

for this_file in my_files:
    this_rule = ''
    this_table = ''
    bnx = os.path.basename(this_file)
    this_needs_table = needs_table(this_file)
    this_needs_quotes = 'txt' not in this_file
    quote_idx = 2 if this_needs_quotes else 1
    with open(this_file) as file:
        for (line_count, line) in enumerate (file, 1):
            if not line.strip():
                this_rule = ''
                this_table = ''
                continue
            if line.startswith('table of'):
                this_table = line.lower()
                this_table = re.sub(" *\[.*", "", this_table).strip()
                continue
            x = re.findall("this is the [^\.\?!]* rule", line)
            if x:
                this_rule = x[0]
                continue
            if this_needs_quotes and '"' not in line:
                continue
            if this_needs_table and section_disqualified(this_table):
                continue
            quote_ary = line.lower().strip().split('"')
            if this_needs_quotes:
                quote_ary = quote_ary[1::2]
            for quote in quote_ary:
                q = re.sub("[\.\?!]", "", quote)
                q = re.sub("\[.*?\]", "", q).strip()
                q = re.sub("[',.:;]", "", q).replace('-', ' ').replace('(', '').replace(')', '').replace('/', ' ')
                q = re.sub(' +', ' ', q)
                if disqualified(q):
                    continue
                #print(line_count, q)
                detail = this_rule if this_rule else (this_table if this_table else 'undefined')
                line_sig = "{}-{:05d}-{}".format(bnx, line_count, detail)
                totals += process_size_stuff(q, line_sig)

notes_only = notes_tracker(summary='only in notes files', color = mt.PASS)
notes_and_source = notes_tracker(summary='some notes files, some source files', color = mt.WARN)
no_notes = notes_tracker(summary='source files only', color = mt.FAIL)

try:
    arg = sys.argv[1].lower()
    if re.search('[nsb]', arg):
        notes_and_source.display = 'b' in arg
        notes_only.display = 'n' in arg
        no_notes.display = 's' in arg
except:
    print("NSB in argument shows only notes/source/both.")

for s in so_far:
    if track_bad:
        if re.search('[^a-z ]', s):
            print(s, 'line', so_far[s])
    if len(so_far[s]) == 1:
        continue
    a = [ re.sub("-.*", "", y) for y in so_far[s] ]
    a0 = [ x for x in a if 'notes.txt' in a ]
    print_string = "*{}* found in {} files: {}".format(s, len(a), ', '.join(a))#len(so_far[s]), '/'.split(a))
    if len(a0) == len(a):
        notes_only.my_array.append(print_string)
    elif len(a0):
        notes_and_source.my_array.append(print_string)
    else:
        no_notes.my_array.append(print_string)

notes_only.print_stuff()
notes_and_source.print_stuff()
no_notes.print_stuff()
