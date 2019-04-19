import os
import sys

if 'KITWB_KERNELSPECS' not in os.environ:
    print("KITWB_KERNELSPECS NOT SET")
    sys.exit(-1)

OUTPUT="/tmp/output-wrapper"
with open(OUTPUT,'w+') as outfile:
    print("STARTED",file=outfile)
    print("ENV:%s" % os.environ['KITWB_KERNELSPECS'],file=outfile)

kernelspec=sys.argv[1]

os.environ['PYTHONPATH']=os.environ['KITWB_KERNELSPECS'] + "/"+kernelspec + '/venv/lib/python3.6/site-packages'
os.environ['NODE_PATH']=os.environ['KITWB_KERNELSPECS'] + "/"+kernelspec + '/node_modules'
#print("PP:",os.environ['PYTHONPATH'])
#print(sys.argv[2],sys.argv[2:])

os.execvp(sys.argv[2],sys.argv[2:])
