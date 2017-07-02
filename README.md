# Statistic Inference

## Brief Description
### Inferences
* Hypothesis Testing
	* p-value
	* Critical Region
* Interval Estimating
* Goodness of Fit Testing
* Testing for Homogenity
* Testing for Independence

## Environment Setup
[Download R (National Taiwan University Mirror)](http://cran.csie.ntu.edu.tw)

## Usage
Either using R Console or type R in your command line.

And then using `source("Inference.R")` to start the program.

Ps. Don't use RScript to open it. Because it will cause the non-interactively error.


### File Description

#### Main Parser
* **Inference.R**

#### Inference Parser
* **HypothesisTesting.R**
* **IntervalEstimating.R**
* **GoodnessOfFit.R**
* **TestingForHomogeneity.R**
* **RestingForIndependence.R**

#### Function Supporter
* **HypothesisTestingFunctions.R**
	* X tagged in N random survey
		* p-value : *HT\_BINOM\_XTAG\_PV(alpha)* 
		* Critical Region : *HT\_BINOM\_XTAG\_CR(alpha)*

* **GoodnessOfFitFunctions.R**
	* Test if the die is fair with K faces
		* *GOF\_MULTINOM\_DIE(alpha, K)*

* **HomogeneityFunctions.R**
	* M die with K cells have commmon cell probabilities
		* *TFH\_MULTINOM\_KCELL(alpha, M, K)*
		
* **IndependenceFunctions.R**
	* Compare attribute A and B (one multinomial distribution with a*b cells)
		* *TFI\_MULTINOM\_abCELL(alpha, a, b)*
		
* **PValueCriticalRegion.R**
	* *PValue(pvalue, alpha)* ⎯⎯ p-value inference function
	* *PH1(ph0, DRorNot)* ⎯⎯ hypothesis 1 parser
* **PlotDiagram.R**


## Todo and Progress
### Hypothesis Testing
#### Binomial Distribution
- [X] Population Proportion (p-value & Critical Region)

#### Negative-binomial Distribution
#### Normal Distribution
#### Chi-square Distribution
#### T Distribution

### Interval Estimating

### Goodness of Fit Testing
- [X] Test if the die is fair with K faces (p-value & Critical Region)

### Testing for Homogenity
- [X] M die with K cells have commmon cell probabilities (Critical Region & p-value)


### Testing for Independence
- [X] Compare attribute A and B (p-value & Critical Region)


### Plot Functions
- [X] Chi-square Distribution (p-value & Critical Region)
	* Used by
		* Goodness of Fit: Test if the die is fair with K faces
		* Testing for Homogenity: M die with K cells have commmon cell probabilities
		* Testing for Independence: Compare attribute A and B

- [X] Binomial Distribution (p-value & Critical Region)
	* Used by
		* Hypothesis Testing: Population Proportion


## Notes
### R Language
* Input variable as number `as.numberic(readline("prompt"))`
* Print variable value in a string e.g. `cat("Hello", variable, "\n")` `cat(sprintf("Result = %f", res))` `print(paste("Hello", "World", sep=""))`
