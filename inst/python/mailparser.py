import sys
import email

def parse(filename):
  with open(filename) as fp:
    msg = email.message_from_file(fp)
  return msg

if __name__ == "__main__":
  print("parse that")
  #print(sys.argv[1])
  msg = parse("/tmp/RtmpeSLRPH/file60f57e51d2")
  print(msg["date"])
  print(msg.keys())
  print(msg.items())
