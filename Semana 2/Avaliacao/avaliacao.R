# 1
pollutantmean = function(directory, pollutant, id = 1:332){
        
        files_list = list.files(directory, full.names = T)
        dataset = data.frame()
        dataset_subset = data.frame()
        
        for(i in 1:332){
                dataset = rbind(dataset, read.csv(files_list[i]))
        }
        
        for(i in id){
                indexes = dataset[, "ID"] == i
                dataset_subset = rbind(dataset_subset, dataset[indexes,])  
        }
        
        mean(dataset_subset[,pollutant], na.rm = T)
}

pollutantmean("specdata", "sulfate", 1:10)


# 2
complete = function(directory, id = 1:332){
        
        files_list = list.files(directory, full.names = T)
        dataset = data.frame()
        dataset_subset = data.frame()
        dataset_result = data.frame()
        
        for(i in 1:332){
                dataset = rbind(dataset, read.csv(files_list[i]))
        }
        
        for(i in id){
                indexes = dataset[, "ID"] == i
                dataset_subset = dataset[indexes,]
                isComplete = !is.na(dataset_subset[,"sulfate"]) & !is.na(dataset_subset[,"nitrate"])
                
                dataset_result = rbind(dataset_result, c(i,sum(isComplete)))
        }
        names(dataset_result) = c("id","nobs")
        dataset_result
}

complete("specdata", c(2, 4, 8, 10, 12))

# 3

corr = function(directory, threshold = 0){
        
        if (threshold == 0){
                return(0)
        }
        
        files_list = list.files(directory, full.names = T)
        dataset = data.frame()
        dataset_subset = data.frame()
        
        for(i in 1:332){
                dataset = rbind(dataset, read.csv(files_list[i]))
        }
        
        isComplete = !is.na(dataset[,"sulfate"]) & !is.na(dataset[,"nitrate"])
        dataset_subset = dataset[isComplete,]
        
        # cor(dataset_subset[1:threshold,"sulfate"],dataset_subset[1:threshold,"nitrate"])
        cor(dataset_subset[1:threshold,c("sulfate","nitrate")])
}

# função errada, não entendi o que é pra fazer
cr = corr("specdata", 400)
head(cr)
summary(cr)
