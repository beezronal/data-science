library(dplyr)
library(purrr)
library(ggplot2)
library(factoextra)

custsales=read.csv("C:/Users/Aye.Yupar/2026_dss/Customer Segments.csv")
head(custsales)

dim(custsales)

#omitting the rows with missing values
custsales<-na.omit(custsales)

# Subset data by deleting customerID
custsales_cl<-subset(custsales,select=-Cust_ID)
head(custsales_cl)

# Standardise all variables using scale function
custsales_cl<-scale(custsales_cl) %>% as.data.frame()
head(custsales_cl)

# Create plot for elbow method to decide optimum number of clusters
wss <- function(k){
  kmeans(custsales_cl, k,iter.max = 1000)$tot.withinss
}
k.values <- 1:15
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch=19, frame = FALSE,
     xlab="Number of cluster K",
     ylab="Total within-clusters sum of squares"
     )

# running kmeans
set.seed(123)
CL<-kmeans(custsales_cl,4)

# cluster size
CL$size

# add cluster membership to the data
custsales$segment<-CL$cluster
head(custsales)

# calculate mean of each variable clusterwise and round off values to two decimal plaes
allmean <- aggregate(cbind(Age, BillAmt_Product, BillAmt_Service,BillAmt_Pre,Vintage)~segment,data=custsales,FUN=mean)
allmean=allmean %>% map(round,2) %>% as.data.frame()

# summarising each variables (average value) within each cluster
ggplot(allmean, aes(x = segment, y = Age))+
  geom_bar(stat = "identity", fill = "steelblue")+
  geom_text(aes(label = Age), vjust = -0.5, color = "black", size=3)+
  labs(x = "Cluster", y = "Age")

# BillAmt_Product
ggplot(allmean, aes(x = segment, y = BillAmt_Product))+
  geom_bar(stat = "identity", fill = "steelblue")+
  geom_text(aes(label = BillAmt_Product), vjust = -0.5, color = "black", size=3)+
  labs(x = "Cluster", y = "BillAmt_Product")

# BillAmt_Service
ggplot(allmean, aes(x = segment, y = BillAmt_Service))+
  geom_bar(stat = "identity", fill = "steelblue")+
  geom_text(aes(label = BillAmt_Service), vjust = -0.5, color = "black", size=3)+
  labs(x = "Cluster", y = "BillAmt_Service")

# BillAmt_Pre
ggplot(allmean, aes(x = segment, y = BillAmt_Pre))+
  geom_bar(stat = "identity", fill = "steelblue")+
  geom_text(aes(label = BillAmt_Pre), vjust = -0.5, color = "black", size=3)+
  labs(x = "Cluster", y = "BillAmt_Pre")

# Vintage
ggplot(allmean, aes(x = segment, y = Vintage))+
  geom_bar(stat = "identity", fill = "steelblue")+
  geom_text(aes(label = Vintage), vjust = -0.5, color = "black", size=3)+
  labs(x = "Cluster", y = "Vintage")
