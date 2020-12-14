# KmeansAlgorithm

It is aimed to cluster a unlabeled dataset which have 2 features with K-means. According to similar and minimum properties of the dataset, dataset will be labeled. K-means is an algorithm that computing clusters with respect to mean distance.

1. Data Import, Normalization and Visualization of Comparing Normal Data and Normalized Data
2. Initializing Centroids
3. Program Situation
4. Distance Matrix
5. Calculating Minimum Distances
6. Updating Centroids
7. Viusalizing Output
Extra: Calculating mean squared error between old and new centroids

# 1. Data Import, Normalization and Visualization of Comparing Normal Data and Normalized Data

Data is loaded from .mat file to X matrix and is preprocessed with “prep” function. (between 0 and 1).

# 2. Initializing Centroids

Necessary variable that identifies cluster numbers is obtained from user with input command. Then centroids are identified in a range of minimum and maximum values of the processed dataset. “a” and “b” represents these values. After that initial centroids visualized on non-clustered dataset. Also, another necessary number, maximum iteration number is defined.

# 3. Program Situation

In iteration part, script continues with printing situation of program. According to iteration number, when program is executed, user can follow iteration number from command window.

# 4. Distance Matrix

This is not a official distance matrix. Actually, it computes distance of each dataset to related center points. Distances are computed with the helper function named “euc”. It computes Euclidean distances between datapoints and centroids.

# 5. Calculating Minimum Distances

This part is very important, that cluster numbers are created against minimum column indices by calculating transpose and minimum of this matrix. Originally cmp becomes 525x1 array but for saving from space, it was shown horizontally.

# 6. Updating Centroids

In previous section “cmp” is calculated where cmp is array that keeps minimum indice information. With using this variable as an indice of normalized dataset, it is possible to reach minimum values of each cluster.

# 7. Viusalizing Output

Since output is desired to be visualized at 1st, 10th , 50th and at every 100th step, following part is coded. Plot functions will visually cluster data points at number of k values. For instance if there is only 3 clusters, 4th or 5th row won’t print anything.

#   Extra: Calculating mean squared error between old and new centroids

This part is arbitrarily created. As it can be seen at start of while loop there is condition that in comment. (E>0). If comment operators will be deleted from extra part and front of E, and comment through “maxiter“ variable, K-means will iterate until this value reaches 0. Personally, it wasn’t preferred as first choice cause of early reaching 0. It is possible to see more movement with large numbered maximum iteration count. (Like 400).