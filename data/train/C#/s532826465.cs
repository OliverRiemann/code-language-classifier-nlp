using System;

namespace AIZUJudge {
    class EquisionSolver {
        static void Main(string[] args) {
            string line = "";
            while ((line = Console.ReadLine()) != null) {
                string[] set = line.Split(' ');
                int devides = 2;
                int lineLength = 3;

                Matrix eqMatrix = new Matrix(devides,lineLength-1);
                Matrix scalar = new Matrix(devides,1);

                for (int i = 0; i < devides; i++) {
                    for (int j = 0; j < lineLength-1; j++) {
                        eqMatrix.setElement(i, j, set[i*lineLength+j]);
                    }
                }
                scalar.setElement(0, 0,set[2]);
                scalar.setElement(1, 0, set[5]);

                double[] sol = eqMatrix.solveEq(scalar,2);
                Console.WriteLine(sol[0].ToString("f3") + " " + sol[1].ToString("f3"));
            }
       }
    }
    
    public class Matrix {
        double[,] element;
        public Matrix(int rowSize, int columnSize) {
            element = new double[rowSize, columnSize];
        }
        public void setElement(int row, int column, string value) {
            element[row, column] = double.Parse(value);
        }
        public double[] solveEq(Matrix scalar,int sol_Length) {
            double[] solution = new double[sol_Length];
            solution[0] = (element[1, 1] * scalar.element[0, 0] - element[0, 1] * scalar.element[1, 0]) / (element[0, 0] * element[1, 1] - element[0, 1] * element[1, 0]);
            solution[1] = (element[0, 0] * scalar.element[1, 0] - element[1, 0] * scalar.element[0, 0]) / (element[0, 0] * element[1, 1] - element[0, 1] * element[1, 0]);
            return solution;
        }
    }
}