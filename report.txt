- The assignment was performed in R v3.1.2 - "Pumpkin Helmet".
- The package rpart was used for the construction of Decision Trees.

Handling Absurd Values
-----------------------

- The number of data vectors being only 768, leaving out vectors with absurd values was not a viable
alternative.
- Absurd values were replaced with missing values - namely 'NA' in R - and were handled by creating
a maximum of 5 surrogates where possible.
- The following attribute values were considered absurd for the sake of this experiment by using
consulting standard medical resources:
   - glucose concentration = 0
   - diastolic blood pressure = 0
   - tricep skin fold thickness = 0
   - insulin = 0
   - bmi = 0

Observations
------------

- The following are the five fold values for accuracy:

                                    Information                 Gini
Threshold on vectors
Threshold on impurity
Grow tree and prune
