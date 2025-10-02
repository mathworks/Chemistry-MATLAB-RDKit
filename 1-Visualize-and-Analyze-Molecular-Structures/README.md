#  Visualize and Analyze Molecular Structures
![alt text](Intro_Image.jpg)

This example demonstrates how to use [MATLAB&reg;](https://www.mathworks.com/products/matlab.html)-[RDKit](https://www.rdkit.org/) together to visualize D-Glucose and Luseogliflozin using their [SMILES](https://en.wikipedia.org/wiki/Simplified_molecular-input_line-entry_system) strings.
A practical perspective of this simple task is provided concerning the Sodium-glucose co-transporter 2 (SGLT2) protein along with some exercises. 

## Video
Check out the accompanying video to see how this code works in action! 
> [Video: Visualize and Analyze Molecular Structures](https://www.mathworks.com/videos/visualize-and-analyze-molecular-structures-1743152846884.html)

## Setup 
To Run this example use this MATLAB Live Script: 
> Visualize and Analyze Molecular Structures.mlx  


### MathWorks Products (https://www.mathworks.com)

> [MATLAB](https://www.mathworks.com/products/matlab.html)

> [Bioinformatics toolbox&trade;](https://www.mathworks.com/products/bioinfo.html)

### 3rd Party Products:

> [Python&reg;](https://www.python.org/)

> [RDKit Open-Source Cheminformatics Software](https://www.rdkit.org/)


## Installation
Set up your Python environment by following the instructions provided in the guide found at [Python](https://www.python.org/) webpage. Make sure to give the python address and to check versions of Python compatible with MATLAB products by release. This allows to build proper [MATLAB Interface to Python](https://www.mathworks.com/support/requirements/python-compatibility.html). 

This example uses some of the functions from [RDKit](https://www.rdkit.org/). It can be installed easily by following its installation instructions on Linux, Windows, and macOS. You can install RDKit using _pip install rdkit_.


The [Bioinformatics toolbox](https://www.mathworks.com/products/bioinfo.html) Toolbox in MATLAB is only required for the 3D visualization of protein structures using the molviewer function. If you do not have this toolbox, you can simply install it by following the instructions at [Get and Manage Add-Ons](https://www.mathworks.com/help/matlab/matlab_env/get-add-ons.html)

If you don't add this toolbox, you can still run the rest of your code without issues by simply commenting out the line _molviewer(pdbID);_.


## Getting Started 
Follow the steps provided in this MATLAB Live Script:

> Visualize and Analyze Molecular Structures.mlx 

## Exercises
Try the exercises provided at the end of this example:

> Visually inspect the molecular structures 

> How can we quantify molecular similarity beyond visual inspection?

> Think about how this simple exercise is used in drug discovery!


## License
The license is available in the License.txt file in this GitHub repository.

## Community Support
[MATLAB Central](https://www.mathworks.com/matlabcentral)

Copyright 2024 The MathWorks, Inc.












