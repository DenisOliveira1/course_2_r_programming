
setwd("~/Área de Trabalho/R_Programming/Semana 4/Avaliacao/rprog_data_ProgAssignment3-data")

dataset = read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(dataset)
ncol(dataset)
nrow(dataset)

# 1. Plot the 30-day mortality rates for heart attack

dataset[, 11] 
dataset[, 11] <- as.numeric(dataset[, 11])
dataset[, 11] 

hist(dataset[, 11])

# 2. Finding the best hospital in a state

best <- function(state, outcome) {
        
        ## Read outcome data
        dataset = read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        uniqueStates = unique(dataset$State)
        if (is.na(match(state,uniqueStates))){
                stop("invalid state")
        }
        
        if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia"){
                stop("invalid outcome")
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        indexes = dataset[, "State"] == state 
        subset = dataset[indexes,]
        
        if (outcome == "heart attack"){
                subset[, 11] <- as.numeric(subset[, 11])
                subset = subset[order(subset[,11]),]
                return(subset[1,2])
        }
        else if (outcome == "heart failure"){
                subset[, 17] <- as.numeric(subset[, 17])
                subset = subset[order(subset[,17]),]
                return(subset[1,2]) 
        }
        else if (outcome == "pneumonia"){
                subset[, 23] <- as.numeric(subset[, 23])
                subset = subset[order(subset[,23]),]
                return(subset[1,2])
        }
}

best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")

# 3. Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        dataset = read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        uniqueStates = unique(dataset$State)
        if (is.na(match(state,uniqueStates))){
                stop("invalid state")
        }
        
        if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia"){
                stop("invalid outcome")
        }
        
        ## Return hospital name in that state with the given rank 0-day death rate
        indexes = dataset[, "State"] == state
        subset = dataset[indexes,]
        subset = subset[order(subset[,2]),]
        
        if (outcome == "heart attack"){
                subset[, 11] <- as.numeric(subset[, 11])
                indexes = !is.na(subset[, 11]) 
                subset = subset[indexes,]
                
                subset = subset[order(subset[,11]),]
        }
        else if (outcome == "heart failure"){
                subset[, 17] <- as.numeric(subset[, 17])
                indexes = !is.na(subset[, 17]) 
                subset = subset[indexes,]
                                
                subset = subset[order(subset[,17]),]
        }
        else if (outcome == "pneumonia"){
                subset[, 23] <- as.numeric(subset[, 23])
                indexes = !is.na(subset[, 23]) 
                subset = subset[indexes,]
                
                subset = subset[order(subset[,23]),]
        }
        
        if(num == "best"){
                return(subset[1,2])  
        }
        else if(num == "worst"){
                return(tail(subset[,2],1))
        } else{
                return(subset[num,2])   
        }
}

rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)

# 4. Ranking hospitals in all states

rankall <- function(outcome, num = "best") {
        answer = data.frame()
        
        ## Read outcome data
        dataset = read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that the outcome is valid
        if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia"){
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        uniqueStates = unique(dataset$State)
        
        for (state in uniqueStates){
                indexes = dataset[, "State"] == state
                subset = dataset[indexes,]

                if (outcome == "heart attack"){
                        subset[, 11] <- as.numeric(subset[, 11])
                        indexes = !is.na(subset[, 11]) 
                        subset = subset[indexes,]
                        
                        subset = subset[order(subset[,11]),]
                        
                        answer = rbind(answer, c(subset[num,2], state)) 
                }
                else if (outcome == "heart failure"){
                        subset[, 17] <- as.numeric(subset[, 17])
                        indexes = !is.na(subset[, 17]) 
                        subset = subset[indexes,]
                        
                        subset = subset[order(subset[,17]),]
                        
                        answer = rbind(answer, c(subset[num,2], state)) 
                }
                else if (outcome == "pneumonia"){
                        subset[, 23] <- as.numeric(subset[, 23])
                        indexes = !is.na(subset[, 23]) 
                        subset = subset[indexes,]
                        
                        subset = subset[order(subset[,23]),]
                
                }
                
                if(num == "best"){
                        answer = rbind(answer, c(subset[1,2], state))  
                }
                else if(num == "worst"){
                        answer = rbind(answer, c(tail(subset[,2],1), state)) 
                } else{
                        answer = rbind(answer, c(subset[num,2], state))  
                }
        }
        
        ## Return a data frame with the hospital names and the (abbreviated) state name
        return(answer)
}

a = rankall("heart attack", 20)

a# avaliacao
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)

rankhospital("HI", "heart attack", 4)
rankhospital("NJ", "pneumonia", "worst")
rankhospital("NV", "heart failure", 10)
