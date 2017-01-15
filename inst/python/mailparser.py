import sys
import json
from email import message_from_file
from email.header import decode_header, make_header

def parse(filename):
  with open(filename) as fp:
    msg = message_from_file(fp)
  fields = ["from", "to", "date", "subject"]
  header = {field: str(make_header(decode_header(msg[field]))) for field in fields}
  return header

if __name__ == "__main__":
  #print("parse that")
  header = parse(sys.argv[1])
  print(json.dumps(header, ensure_ascii = False))
