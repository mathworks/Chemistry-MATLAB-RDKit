from rdkit.ML.Cluster import Butina
from rdkit import DataStructs

def tanimoto_distance_matrix(fp_list):
    """Calculate distance matrix for fingerprint list."""
    dissimilarity_matrix = []
    for i in range(1, len(fp_list)):
        similarities = DataStructs.BulkTanimotoSimilarity(fp_list[i], fp_list[:i])
        dissimilarity_matrix.extend([1 - x for x in similarities])
    return dissimilarity_matrix

def cluster_fingerprints(fingerprints, cutoff=0.2):
    """Cluster fingerprints using Butina algorithm."""
    distance_matrix = tanimoto_distance_matrix(fingerprints)
    clusters = Butina.ClusterData(distance_matrix, len(fingerprints), cutoff, isDistData=True)
    return clusters

# Assuming `fingerprints` and `cutoff` are passed from MATLAB
clusters = cluster_fingerprints(fingerprints, cutoff)