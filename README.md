A "fixed" git log:
```
git log --format='%H %s' demo
0114519293696360924e23bef74a64cc0649dd9a Add OR pattern
094fdc9886eddda9909ae15c4ab2e1b5b286b47e Make prefix the default again
58c107d041e7459b850c5407292f74203346f4d8 Add stegit.sh, which can force a pattern on a revision range
8b81073f23b52345e09c0cf92a485305979f02a2 Treat given pattern as regular expression
0c47382b48b8132e91536fcb0c650e3835d975f8 Add simple working pattern matching
0b51427f97ecedd6029e0087f42b79634cddf845 Add pattern flag
9a99821f46c0670f6431b562fc4228c067920817 Usage.
4a18824b91d43750e57a781c6adcd001f4b28b25 correct typo in README
55a613f856b21720c02f74508e4ff4df59cca0f5 gitbrute: use a done channel to kill off remaining goroutines
659eae9302c99017f58bb1222c82e5a86ae059bb Use `git rev-parse HEAD` to get the current hash
9788751156685902899789d54b5a8a48414345e4 Fix typo.
bf175b49734ccff5686ce00f64f87faefc53161d gitbrute initial commit.
```

Removing all the digits from the hashes:
```
git log --format='%H %s' demo | sed 's/[0-9]/ /g'
                   e  bef  a  cc    dd a Add OR pattern
   fdc    eddda    ae  c ab e b b   b  e Make prefix the default again
  c   d   e    b   c       f        f d  Add stegit.sh, which can force a pattern on a revision range
 b     f  b     e  c cf  a         f  a  Treat given pattern as regular expression
 c     b  b    e     fcb c   e    d   f  Add simple working pattern matching
 b     f  ecedd    e    f  b     cddf    Add pattern flag
 a     f  c    f    b   fc    c          Usage.
 a     b  d     e  a   c adcd   f b  b   correct typo in README
  a   f   b     c  f     e ff df  cca f  gitbrute: use a done channel to kill off remaining goroutines
   eae    c     f  bb    c  e a  ae   bb Use `git rev-parse HEAD` to get the current hash
                      d  b a a        e  Fix typo.
bf   b     ccff    ce  f  f  faefc     d gitbrute initial commit.
```
