CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission

echo 'Finished cloning'

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f student-submission/ListExamples.java ]]
then 
        echo 'ListExamples.java found'
    else
        echo 'ListExamples.java not found' 
        echo 'Score 0/4'
        exit 1
fi

cp student-submission/ListExamples.java grading-area
javac -cp $CPATH grading-area/*.java

if [[ ! $? = 0 ]]
then 
    echo 'Compiler error in files'
    echo 'Score 0/4'
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > junit-output.txt


FALIURES= grep -c junit-output.txt

if [[ $FALIURES -eq 0 ]]
then 
    echo "All tests passed"
    echo 'Score 4/4'
    exit 1
elif [[ $FALIURES -gt 0 ]]
    grep Failures: junit-output.
    exit 1
fi

