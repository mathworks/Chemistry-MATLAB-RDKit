function RDKitDraw(pythonExecutable, smiles, N_Row, logP, logS)
    % % Set the Python executable in MATLAB
    % pyenv('Version', pythonExecutable);
    % 
    % % Verify Python configuration
    % disp('Python version:');
    % pyversion

    % Import RDKit and PIL modules
    rdkit = py.importlib.import_module('rdkit');
    rdkitChem = py.importlib.import_module('rdkit.Chem');
    rdkitDraw = py.importlib.import_module('rdkit.Chem.Draw');
    Image = py.importlib.import_module('PIL.Image');
    ImageOps = py.importlib.import_module('PIL.ImageOps');
    np = py.importlib.import_module('numpy');

    %disp('RDKit successfully imported in MATLAB.');

    % Create a molecule object from the SMILES string
    mol = rdkitChem.MolFromSmiles(smiles);

    % Generate a 2D depiction of the molecule
    pil_img = rdkitDraw.MolToImage(mol);

    % Convert PIL image to grayscale numpy array
    pil_img = ImageOps.grayscale(pil_img);
    img_array = np.array(pil_img);

    % Convert numpy array to MATLAB format
    imgMat = uint8(img_array.double);

    % Display the molecule image
    imshow(imgMat);
    title(sprintf('LogP: %.2f, LogS: %.2f', logP, logS));
end
