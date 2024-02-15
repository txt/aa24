# Health datasets 0-35

Data from for 3 goals in 12   projects (selected via the STABLIZE process) [^suv]

[^suv]: Suvodeep Majumder, Tianpei Xia, Rahul Krishna, and Tim Menzies. 2022. Methods for stabilizing models across large samples of projects (with case studies on predicting defect and project health). In Proceedings of the 19th International Conference on Mining Software Repositories (MSR '22). Association for Computing Machinery, New York, NY, USA, 566–578. https://doi.org/10.1145/3524842.3527934

|data set | goal|
|----------|-----|
| 0-11 | commits |
| 12-23 | open PRs | 
| 24-35 | open Issues | 

(Note: dataset25 has been removed due to local corruptions.).

Each of the health datasets contains 11 columns.
The left hand side  columns (MRE, ACC, PRED40) are

- MRE being the Mean Relative Error = _abs(predicted - actual)/actual_.
- ACC being the Standardized Accuracy =  (1 - (MAE[^mae]/MAE_GoodGuess)) x 100
- PRED40 being the count of predictions that were within an MRE of 0.4 divided by the total number of predictions

[^mae]: MAE is the mean absolute error 
 
representing three goals measured when training a random forest model to predict for project health 12 months into the future using the configurations defined in the last 5 columns (N_estimators, criterion, Min_sample_leaves, Min_impurity_decrease, Max_depth) 

For the goal columns we want to **Minimize** MRE and **Maximize** ACC and PRED40
