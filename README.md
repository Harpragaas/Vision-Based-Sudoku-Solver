# Vision-Based-Sudoku-Solver

#Part of a group project (COMPUTER VISION : The Australian National University) :

   Members : 
   1. Harpragaas Singh
   2. Satya Medicherla
   3. Kaushik Ghosh
   4. Nimish Magre


#Project Aim - The overall project goal is to solve a sudoku puzzle, which is printed on a page, using computer vision techniques. The process reflects the concept of human-computer interaction because the information gained is not only obtained by computers but also enhanced with human activities.


#Watch the demo video here: https://drive.google.com/open?id=1cxAGUP091Z-xhSjUFSU5FGgetPISAtOo


#Instructions
To use Vision-based Sudoku solver, please open and run the file 'Webcam.m' in the folder 'Sudoku_Solver_SourceCode'. After running the file, there will be a button on the user interface: 'Click Image'. Please follow the instructions below:  

- Click the button 'Click Image' to access the camera. It may take a few seconds, depending on your computer.    
- Select the  region of interest (RoI) that includes the Sudoku Puzzle.
- Double click to confirm the RoI.  
- The Solved Sudoku result will be displayed after a few seconds. A difficulty level for the Sudoku will also be shown.


#Prerequisites

1. Camera with minimum resolution 1920*1080
2. Windows Platform based MATLAB (version R2018a) with
   a) Neural Network toolbox
   b) Image Processing Toolbox
   c) Computer Vision System Toolbox
   d) Image Acquisition Toolbox
   e) Mapping Toolbox
   f) YALMIP Toolbox, available in the folder YALMIP-master(from https://yalmip.github.io/download/)
   g) Image Acquisition ToolboxSupport Package for OS Generic Video Interface


#Important Notes

- Please add the provided 'YALMIP-master' folder to the MATLAB path.
- If your computer runs on MacOs platform, please change the 'winvideo' to 'macvideo' in the file 'Webcam.m'.
- Please ensure that there is normal illuminance available for testing.
- The testing computer is Microsoft Surface Pro3. The default camera is 'Microsoft Camera Rear'.
