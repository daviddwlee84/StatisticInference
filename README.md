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
* **PValueCriticalRegion.R**
	* *PValue(pvalue, alpha)* : p-value inference function
	* *PH1(ph0, DRorNot)*: hypothesis 1 parser
* **PlotDiagram.R**

## Environment Setup
[Download R (National Taiwan University Mirror)](http://cran.csie.ntu.edu.tw)

## Usage
Either using R Console or type R in your command line.

And then using `source("Inference.R")` to start the program.

Ps. Don't use RScript to open it. Because it will cause the non-interactively error.


## Todo and Progress
### Hypothesis Testing
#### Binomial Distribution
- [X] Population Proportion (p-value & Critical Region)
- [X] Plot Function (p-value & Critical Region)

#### Negative-binomial Distribution
#### Normal Distribution
#### Chi-square Distribution
#### T Distribution

### Interval Estimating

### Goodness of Fit Testing
### Testing for Homogenity
### Testing for Independence


## Notes
### R Language
* Input variable as number `as.numberic(readline("prompt")`
* Print variable value in a string e.g. `cat("Hello", variable, "\n")` `cat(sprintf("Result = %f", res))`
