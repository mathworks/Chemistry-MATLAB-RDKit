function RDKitDraw(pythonExecutable, smiles, N_Row)
    % Set the Python executable in MATLAB
    pyenv('Version', pythonExecutable);

    % Verify Python configuration
    disp('Python version:');
    pyversion

    % Import RDKit modules
    rdkit = py.importlib.import_module('rdkit');
    rdkitChem = py.importlib.import_module('rdkit.Chem');
    rdkitDraw = py.importlib.import_module('rdkit.Chem.Draw');

    disp('RDKit successfully imported in MATLAB.');

    % Create a molecule object from the SMILES string
    mol = rdkitChem.MolFromSmiles(smiles);

    % Generate an image file with the row number in the name
    molFileName = sprintf('Molecule_Row_%d.png', N_Row);

    % Generate a 2D depiction of the molecule and store it in the file
    rdkitDraw.MolToFile(mol, molFileName);

    % Display the generated .png image
    rgbImage = imread(molFileName);
    imshow(rgbImage);
end