# mkmut.py <file> <patch> <old> <new>: write the patch that replaces the one occurrence of old with new.
import sys,difflib
f,patch,old,new=sys.argv[1:5]
s=open(f).read(); assert s.count(old)==1,(f,old)
t=s.replace(old,new)
open(patch,'w').writelines(difflib.unified_diff(s.splitlines(True),t.splitlines(True),'a/'+f,'b/'+f))
