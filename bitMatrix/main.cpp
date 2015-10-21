#include <iostream>
#include <random>
#include <cstring>

uint64_t *createMatrix(int rows, int cols){
    int matrixElements = (rows * cols + 63)/64;
    uint64_t *myMatrix = new uint64_t[matrixElements];
    memset(myMatrix, 0, matrixElements * 8);
    return myMatrix;
}

void destroyMatrix(uint64_t *matrix){
    delete[] matrix;
}

void setBit(uint64_t *matrix, int total_cols, int row, int col){
    int arrayPos = row * total_cols + col;
    int block = arrayPos / 64;
    int blockPos = arrayPos % 64;
    uint64_t setNum = uint64_t{1} << (63 - blockPos);
    matrix[block] |= setNum;
}

void clearBit(uint64_t *matrix, int total_cols, int row, int col){
    int arrayPos = row * total_cols + col;
    int block = arrayPos / 64;
    int blockPos = arrayPos % 64;
    uint64_t clearNum = ~(uint64_t{1} << (63 - blockPos));
    matrix[block] &= clearNum;
}

void toggleBit(uint64_t *matrix, int total_cols, int row, int col){
    int arrayPos = row * total_cols + col;
    int block = arrayPos / 64;
    int blockPos = arrayPos % 64;
    uint64_t togNum = uint64_t{1} << (63 - blockPos);
    matrix[block] ^= togNum;
}

bool testBit(uint64_t *matrix, int total_cols, int row, int col){
    int arrayPos = row * total_cols + col;
    int block = arrayPos / 64;
    int blockPos = arrayPos % 64;
    uint64_t mask = uint64_t{1} << (63 - blockPos);
    uint64_t test = matrix[block] & mask;
    if (test > 0){
        return true;
    }
    return false;
}

bool matrixEqual(bool **oracle, uint64_t *matrix, int rows, int cols){
    for (int i = 0; i < rows; ++i){
        for (int j = 0; j < cols; ++j){
            if (oracle[i][j] != testBit(matrix, cols, i, j)){
                return false;
            }
        }
    }
    return true;
}

void testMatrix(int rows, int cols) {
    std::cout << "Testing matrix with " << rows << " rows and " << cols << " columns\n";
    uint64_t *matrix = createMatrix(rows, cols);
    bool **oracle = new bool*[rows];
    for (int i = 0; i < rows; ++i){
        oracle[i] = new bool[cols];
        for (int j = 0; j < cols; ++j){
            oracle[i][j] = 0;
        }

    }
    std::uniform_int_distribution<unsigned> r(0, rows - 1);
    std::uniform_int_distribution<unsigned> c(0, cols - 1);
    std::default_random_engine e (time(NULL));
    for (int i = 0; i < (rows * cols)/2; ++i){
        int setRow = r(e);
        int setCol = c(e);
        setBit(matrix, cols, setRow, setCol);
        oracle[setRow][setCol] = 1;
        bool success = matrixEqual(oracle, matrix, rows, cols);
        if (success == false){
            std::cout << "setBit failed at position (" << setRow << "," << setCol << ")\n";
        }
    }
    for (int i = 0; i < (rows * cols)/2; ++i){
        int clearRow = r(e);
        int clearCol = c(e);
        clearBit(matrix, cols, clearRow, clearCol);
        oracle[clearRow][clearCol] = 0;
        bool success = matrixEqual(oracle, matrix, rows, cols);
        if (success == false){
            std::cout << "clearBit failed at position (" << clearRow << "," << clearCol << ")\n";
        }
    }
    for (int i = 0; i < (rows * cols)/2; ++i){
        int togRow = r(e);
        int togCol = c(e);
        toggleBit(matrix, cols, togRow, togCol);
        oracle[togRow][togCol] = !oracle[togRow][togCol];
        bool success = matrixEqual(oracle, matrix, rows, cols);
        if (success == false){
            std::cout << "toggleBit failed at position (" << togRow << "," << togCol << ")\n";
        }
    }
    for (int i = 0; i < rows; ++i)
        delete[] oracle[i];
    delete[] oracle;
    destroyMatrix(matrix);
}

int main() {
    testMatrix(8,8);
    testMatrix(64,1);
    testMatrix(1,64);
    testMatrix(5,13);
    testMatrix(13,5);
    testMatrix(1,65);
    testMatrix(65,1);
    testMatrix(43,3);
    testMatrix(3,43);
    testMatrix(193,1);
    testMatrix(1,193);
    testMatrix(257,1);
    testMatrix(1,257);
    testMatrix(107,3);
    testMatrix(3,107);
    testMatrix(35,11);
    testMatrix(11,35);
    testMatrix(449,1);
    testMatrix(1,449);
    testMatrix(27,19);
    testMatrix(19,27);
    testMatrix(577,1);
    testMatrix(1,577);
    testMatrix(641,1);
    testMatrix(1,641);
    testMatrix(47,15);
    testMatrix(15,47);
    testMatrix(4,41);
    testMatrix(20,35);
    testMatrix(74,1);
    testMatrix(70,39);
    testMatrix(55,53);
    testMatrix(34,69);
    testMatrix(100,100);
    testMatrix(200,200);
    return 0;
}
