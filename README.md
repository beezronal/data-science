# Data Science learning footprints

Date: 12 September 2026
### K-Means and Cluster Analysis in R and Python

Used the sample dataset "Customer Segments.csv" provided from Woolf University. 
Consist rows 24,019 with 7 data points.
#### Data transformation (R function)
**na.omit()** transfrom omitted the rows with missing values but there was no missing.  
**subset()** transform deleting the unnecessary data points.
Then standarise all variables with **scale()**.
Decision for optimum number of cluster using with **elbow method**.
Add data into the clusters later calculate mean of each variable. Run **K-Means** till the data end. Finally **ggplot()** . summarize each variable and daw the graph for data decision making. 
The largeszie of data analysed segments, and appeals data as intrinsic information. 
After reading the publish paper: K-Means and K-Medoids: Cluster Analysis on Brith Data Collected in City Muzaffarabad, Kashmir by Syed Ali Abbas and Adil Aslam, et all. There were different methods can apply into the K-Means (scale, range, without data transformation and Yeo-Johnson) methods. They claims that **Yeo-Johnson** is more powerful data transformation.However, I not use the power transformation in my exercise files. 
