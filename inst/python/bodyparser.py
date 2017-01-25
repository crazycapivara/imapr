import sys
import json
from email import message_from_file

def read_msg(filename):
  with open(filename) as fp:
    msg = message_from_file(fp)
  return(msg)

def _get_payload(part):
  charset = part.get_content_charset()
  return part.get_payload(decode = True).decode(charset)

def walk(msg):
  data = {"plain": "", "html": ""}
  for part in msg.walk():
    content_type = part.get_content_type()
    if content_type == "text/plain":
      data["plain"] += _get_payload(part)
    elif content_type == "text/html":
      data["html"] += _get_payload(part)
  return data

def parse(msg):
  if msg.is_multipart():
    data = walk(msg)
  else:
    #data = {"plain": "Hi folks!"}
    data = _get_payload(msg)
  return(data)

if __name__ == "__main__":
  msg = read_msg(sys.argv[1])
  data = parse(msg)
  print(json.dumps(data, ensure_ascii = False))
