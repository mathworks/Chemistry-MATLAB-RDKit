# Compute_Fingerprints.py
from rdkit import Chem
from rdkit.Chem import AllChem
import numpy as np

def get_fingerprint(smi):
    mol = Chem.MolFromSmiles(smi)
    if mol is None:
        return None
    fp = AllChem.GetMorganFingerprintAsBitVect(mol, 2, nBits=2048)
    arr = np.zeros((2048,), dtype=np.uint8)
    # RDKit BitVect to numpy array
    fp.ToBitString()  # for compatibility
    return np.array(list(fp.ToBitString()), dtype=np.uint8)

def compute_all_fingerprints(smilesList):
    fps = []
    for smi in smilesList:
        fp = get_fingerprint(smi)
        if fp is not None:
            fps.append(fp)
        else:
            fps.append(np.zeros((2048,), dtype=np.uint8))  # fallback for invalid SMILES
    return np.stack(fps)

# smilesList is passed in from MATLAB as a Python list
fingerprints = compute_all_fingerprints(smilesList)