#!/usr/bin/env python

import io
import sys
import argparse
import json
import subprocess
try:
    to_unicode = unicode
except NameError:
    to_unicode = str

def main():
    #Bash command for all hosts ping
    bashCommand = "ansible -m ping all"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    #Open file for output stdout -> json file steam
    with io.open('inventory.json', 'w', encoding='utf8') as f:
        str_ = json.dumps(output, f,
                          sort_keys=True, indent=4,
                          separators=(',', ': '), ensure_ascii=False)
        # Here is magick eval function                        
        f.write(to_unicode(eval(str_)))
main()