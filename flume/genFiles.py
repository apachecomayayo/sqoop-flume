import os
import sys
import time
import argparse
import random
import datetime

def main():

	parser = argparse.ArgumentParser()
	parser.add_argument('-p', '--path', help='Generator File Path')
	parser.add_argument('-t', '--timeSleep', help='Sleep Time')
	args = parser.parse_args()

	if not args.path:
		print("\tERROR --> Missing Parameter -> add -p <path>")
		print("-----------> END <-----------")
		sys.exit(1)
	else:
		path = args.path

	if not args.timeSleep:
		sleepSeconds = 0
	else:
		sleepSeconds = int(args.timeSleep)


	for x in range(20):
		outputFile = open(os.path.join(path, "file_" + datetime.datetime.now().strftime('%Y-%m-%d_%H_%M_%S') + ".txt"), "a+")
		for x in range(10):
			outputFile.write(str(random.randint(1,101)) + "," + str(random.randint(1,101)) + "\n")
		outputFile.close
		time.sleep(sleepSeconds)


# end main

if __name__ == "__main__":
	main()