eval quine="print 'eval quine=';p quine"

#Quine:
#takes no input
#produces a copy of its own source code as its only output
#A fixed point of an execution environment

# http://www.skorks.com/2010/03/an-interview-question-that-prints-out-its-own-source-code-in-ruby/
# def method
#   "def method;;end;puts method()[0, 11] + 34.chr + method + 34.chr + method()[11, method.length-11]"
# end
#
# puts method()[0, 11] + 34.chr + method + 34.chr + method()[11, method.length-11]

#a short program that reads its own source code & prints it on the screen
# This is called a quine: https://en.wikipedia.org/wiki/Quine_%28computing%29
