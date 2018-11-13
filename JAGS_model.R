


#JAGS Player Point Poisson Model

#Data

#Model

#Loop thru players
for (i in 1:N) {
#Count Outcome
 y[i] ~ dpois(lambda_hat[i])
#Regression structure for covariates
 lambda_hat[i] <- a + b.home*home[i] + b.team*team[i] + b.oppo*oppo[i] 
}
#Priors
a ~ dnorm(0,0.00001)
b.home ~ dnorm(0, 0.00001)
b.team ~ dnorm(0, 0.00001)
b.oppo ~ dnorm(0, 0.00001)


#Inits


#Gibbs Sampler


#Parameter Extraction


