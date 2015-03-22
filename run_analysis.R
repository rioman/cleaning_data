features <- read.table("UCI HAR Dataset/features.txt")
mean.std.features <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)
shrink.features <- features[mean.std.features, ]
shrink.features$V2 <- sub("-", ".", sub("-", ".", sub("()", "", shrink.features$V2, fixed = T), fixed = T), fixed = T)

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
y.data <- rbind(ytrain, ytest)
y.data$V1 <- factor(y.data$V1, levels = activities$V1)
levels(y.data$V1) <- activities$V2
names(y.data) <- "Activity"

subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject.train, subject.test)
names(subject) <- "Subject"

Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Xdata <-rbind(Xtrain, Xtest)
X.shrink <- Xdata[, mean.std.features]
names(X.shrink) <- shrink.features$V2

All.Data <- cbind(subject, y.data, X.shrink)

Tidy.Data <- aggregate(All.Data[, 3:68], list(Subject=All.Data$Subject, Activity = All.Data$Activity), mean)