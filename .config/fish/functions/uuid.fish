function uuid --description 'generate a new uuid'
  python -c 'import sys,uuid; sys.stdout.write(uuid.uuid4().hex)' | pbcopy
end
