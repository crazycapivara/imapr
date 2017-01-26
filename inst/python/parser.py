import argparse
import json
from email import message_from_file
from email.header import decode_header, make_header

def read_msg(filename):
  with open(filename) as fp:
    msg = message_from_file(fp)
  return msg

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

def parse_header(msg):
  fields = ["from", "to", "date", "subject"]
  return {field: str(make_header(decode_header(msg[field]))) for field in fields}

def parse_body(msg):
  if msg.is_multipart():
    data = walk(msg)
  else:
    #data = {"plain": "Hi folks!"}
    data = _get_payload(msg)
  return(data)

def get_argv():
  parser = argparse.ArgumentParser()
  parser.add_argument("filename")
  parser.add_argument("--header", action = "store_true")
  return parser.parse_args()

if __name__ == "__main__":
  argv = get_argv()
  #print(argv)
  msg = read_msg(argv.filename)
  if argv.header:
    data = parse_header(msg)
  else:
    data = parse_body(msg)
  print(json.dumps(data, ensure_ascii = False))
