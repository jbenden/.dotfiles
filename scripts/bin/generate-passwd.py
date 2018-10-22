#!/usr/bin/python

import random
import string
import sys, os

# print "How many characters would you like the password to have?"
# print "Must be nine or more"
# length = input ()
# password_len = length
# password = []
# for group in (string.ascii_letters, string.punctuation, string.digits):
#     password += random.sample(group, 3)
# password += random.sample(
#                  string.ascii_letters + string.punctuation + string.digits,
#                  password_len - len(password))
# random.shuffle(password)
# password = ''.join(password)
# print password

# Source of most of the code used:
#     http://en.wikipedia.org/wiki/Random_password_generator#Python
#
# The above code could be used in groups, to enforce generation of
#     passwords with a certain count of digits or punctuation; for
#     instance. See the GUI of 1password for an example of a
#     well-defined API necessary to cover all use-cases.

# TODO(jwb): Support Iterator methods for pulling more than one password.
class RandomPasswordGenerator(object):
	"""docstring for RandomPasswordGenerator"""
	def __init__(self, arg):
		super(RandomPasswordGenerator, self).__init__()
		self.arg      = arg
		self.myrg     = random.SystemRandom()
		self.alphabet = string.ascii_letters + string.digits

	def generate(self, length=8):
		pw = str().join(self.myrg.choice(self.alphabet) for _ in range(length))
		return pw

	def __iter__(self):
		return self

	def next(self):
		# can raise StopIteration exception, but no need to...
		return self.generate()

if __name__ == '__main__':
	length = 8
	if len(sys.argv) > 1 and int(sys.argv[1]) > 0:
		length = int(sys.argv[1])
	rpg = RandomPasswordGenerator("")
	print [rpg.generate() for x in xrange(0,10)]
	sys.exit(rpg.generate(length))
