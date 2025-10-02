from rdkit import DataStructs

def compute_similarity(fp1, fp2):
    return DataStructs.TanimotoSimilarity(fp1, fp2)

# Assuming `fp1` and `fp2` are passed from MATLAB
similarity = compute_similarity(fp1, fp2)