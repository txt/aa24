# Health datasets 0-35
Each of the health datasets contains 11 columns.
The first 3 columns (N_MRE, N_ACC, N_PRED40) are pre-normalized values for the returned MRE ACC and PRED40 columns 
MRE being the Mean Relative Error, ACC being the Standardized Accuracy, and PRED40 being the count of predictions that were within an MRE of 0.4 divided by the total number of predictions
representing three goals measured when training a random forest model to predict for project health 12 months into the future using the configurations defined in the last 5 columns (N_estimators, criterion, Min_sample_leaves, Min_impurity_decrease, Max_depth) 

For the goal columns we want to **Minimize** MRE and **Maximize** ACC and PRED40