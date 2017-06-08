#!/usr/bin/env python
import sys

def clear_gpt(disk):
    fd = open(disk, "w+")
    fd.seek(0)
    fd.write('\0' * 34 * 512)
    print "done nuking data at the beginning of disk", disk
    fd.seek(0, 2) # SEEK_END is 2
    disk_size = fd.tell()
    fd.seek(disk_size - 34*512)
    fd.write('\0' * 34 * 512)
    print "done nuking data at the end of disk", disk

if __name__ == '__main__':
    for x in sys.argv[1:]:
        clear_gpt(x)
