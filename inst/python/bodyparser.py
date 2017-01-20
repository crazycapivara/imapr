import sys
import json
from email import message_from_file

def walk(msg):
  data = {"plain": "", "html": ""}
  for part in msg.walk():
    content_type = part.get_content_type()
    #print(content_type)
    charset = part.get_content_charset()
    #print(charset)
    if content_type == "text/plain":
      data["plain"] = part.get_payload(decode = True).decode(charset)
    elif content_type == "text/html":
      data["html"] = part.get_payload(decode = True).decode(charset)
  return data

def parse(filename):
  with open(filename) as fp:
    msg = message_from_file(fp)
  if msg.is_multipart():
    data = walk(msg)
  else:
    data = {"plain": "Hi folks!"}
  return(data)

if __name__ == "__main__":
  data = parse(sys.argv[1])
  print(json.dumps(data, ensure_ascii = False))
