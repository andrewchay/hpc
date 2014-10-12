import sys
import os
# This is a python script that takes two arguments from the 

def main():
    if len(sys.argv) == 1:
        print('The default number of jobs is 20 and the default name "sim" will be used. Current directory is used.\n')
        RName = 'sim'
        numJobs = 20
        path = os.getcwd()
    else:
        if len(sys.argv) == 2:
            print('Default name number of jobs 20 will be used. Current directory is used.\n')
            RName = sys.argv[1]
            numJobs = 20
            path = os.getcwd()
        else:
            if len(sys.argv) == 3:
                print('Current directory is used.\n')
                RName = sys.argv[1]
                numJobs = sys.argv[2]
                path = os.getcwd()
            else:
                if len(sys.argv) == 4:
                    RName = sys.argv[1]
                    numJobs = sys.argv[2]
                    path = sys.argv[3]
    
    filename = 'taskslist'
    
    try:
        file = open(filename, 'w')
        file.close()
        
        
    except:
        print('Something went wrong! Cannot tell what?')
    file = open(filename, "a")
    print("The R file name is " + RName + ", the number of jobs is " + numJobs + ".")
    for i in range(1, int(numJobs) + 1):
        file.write("cd " + path + "; /usr/local/cluster/software/installation/R/R-3.1.0/bin/Rscript " + RName + " " + str(i) + " &\n")
    file.close()
    sys.exit(0)


# This is the standard boilerplate that calls the main() function.
if __name__ == '__main__':
    main()
