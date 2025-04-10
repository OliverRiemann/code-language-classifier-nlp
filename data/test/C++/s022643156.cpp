#include<iostream>
#include<string>
#include<sstream>

const int MAX = 9;

class result{
        private:
                int num[MAX + 1][MAX + 1];

        public:
                result(void);
                int getResult(int, int);
};

class output{
        private:
                result *m_pResult;
                std::string m_strLine[MAX * MAX];

        public:
                output(void);
                ~output(void);
                std::string getLine(int);
};

class screan{
        private:
                output *m_pOp;

        public:
                void setOp(output*);
                void writeLine(void);
};

class consoleApp{
        private:
                output *m_pOutput;
                screan *m_pScrean;

        public:
                consoleApp(void);
                ~consoleApp(void);
                void run(void);
};

// class result method
result::result(){
        for(int i = 1; i <= MAX; i++){
                for(int j = 1; j <= MAX; j++){
                        num[i][j] = i * j;
                }
        }
}

int result::getResult(int x, int y){
        if(x <= MAX && y <= MAX){
                return num[x][y];
        }
}

// class output method
output::output(){
        m_pResult = new result;

        int count = 0;

        for(int i = 1; i <= MAX; i++){
                for(int j = 1; j <= MAX; j++){
                        std::stringstream ss;
                        ss << i << "x" << j << "=" << m_pResult->getResult(i, j);
                        m_strLine[count] = ss.str();
                        count++;
                }
        }
}

output::~output(){
        delete m_pResult;
}

std::string output::getLine(int x){
        return m_strLine[x];
}

// class screan method
void screan::setOp(output *op){
        m_pOp = op;
}

void screan::writeLine(){
        for(int i = 0; i < MAX * MAX; i++){
                std::cout << m_pOp->getLine(i) << std::endl;
        }
}

// class consoleApp method
consoleApp::consoleApp(){
        m_pOutput = new output;
        m_pScrean = new screan;
}

consoleApp::~consoleApp(){
        delete m_pScrean;
        delete m_pOutput;
}

void consoleApp::run(){
        m_pScrean->setOp(m_pOutput);

        m_pScrean->writeLine();
}

// main function
int main(int argc, char **argv){
        consoleApp *ca = new consoleApp;

        ca->run();

        return 0;
}