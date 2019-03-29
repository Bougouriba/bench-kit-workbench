import os
import sys

if 'KITWB_KERNELSPECS' not in os.environ:
    print("KITWB_KERNELSPECS NOT SET")
    sys.exit(-1)

OUTPUT="/tmp/output-wrapper"
with open(OUTPUT,'w+') as outfile:
    print("STARTED",file=outfile)
    print("ENV:%s" % os.environ['KITWB_KERNELSPECS'],file=outfile)

os.environ['PYTHONPATH']=os.environ['KITWB_KERNELSPECS'] + '/venv'
os.environ['NODE_PATH']=os.environ['KITWB_KERNELSPECS'] + '/node_modules'
print(sys.argv[1],sys.argv[1:])

os.execvp(sys.argv[1],sys.argv[1:])
