import numpy as np
import pandas as pd
from rdkit import Chem
from rdkit.Chem import AllChem, DataStructs
import scipy.io
import sys

def compute_fingerprints(smiles_list):
    fingerprints = []
    for smiles in smiles_list:
        mol = Chem.MolFromSmiles(smiles)
        if mol is not None:
            fp = AllChem.GetMorganFingerprintAsBitVect(mol, 2)
            fingerprints.append(fp)
    return fingerprints

# Assuming `smilesList` is passed from MATLAB
fingerprints = compute_fingerprints(smilesList)