Developing Data Products
========================================================
Course Project - Calcalate BMI & BMR

Author: Eric Foo

Date: 27 September 2015

BMI & BMR
========================================================

Body Mass Index (BMI) is a measure of body fat based on height and weight that applies to adult men and women. 

      BMI     |     Category
--------------|-------------------
Below 18.5    |   Underweight
18.5 to 24.9  |   Healthy Weight
25 to 29.9    |   Overweight
30 to 34.9    |   Obese
35 to 39.9    |   Very obese
40+           |   Morbid Obesity

<small>Taken from - http://nutrition.com.sg</small>

Basal Metabolic Rate (BMR) is the amount of energy expended while at rest in a neutrally temperate environment. 


BMI & BMR Calculator
========================================================
The BMI Calculator accepts the following inputs to compute BMI:
- Weight (Metric / Imperial)
- Height (Metric / Imperial)

The BMR Calculator accepts the following inputs to compute BMR:
- Age (Years)
- Gender (Male / Female)
- Weight (Metric / Imperial)
- Height (Metric / Imperial)
- Activity Level (Sedentary / Lightly Active / Moderatetely Active / Very Active / Extra Active)

BMI Calculator
========================================================
Function to compute the BMI given the Weight (kg) and Height (m).

```r
bmi <- function(x, y) {
  val <- x / (y * y);
  return(val)
}
```
Example of a person with weight 86kg and height 1.80m.

```r
bmi(86, 1.80)
```

```
[1] 26.54321
```

BMR Calculator
========================================================
Function to compute the BMI given the Age (Years), Gender, Weight (kg), Height (m) and Activity Level.


```r
bmr <- function(a, b, c, d, e) {
  if (b == "Female") {
        val <- 655 + (9.6 * c) + (1.8 * d * 100) - (4.7 * a)
        } else {val <- 66 + (13.7 * c) + (5 * d * 100) - (6.8 * a)} 
  if (e == "Sedentary") {val <- val * 1.2
  } else if (e == "Lightly") {val <- val * 1.375
  } else if (e == "Moderatetely") {val <- val * 1.55
  } else if (e == "Very") {val <- val * 1.725
  } else {val <- val * 1.9} 
  return(val)}
```


BMR Calculator (cont)
========================================================
Example of a person  37 years old, Male with weight 86kg, height 1.80m and activity level is Sedentary.


```r
bmr(37, "Male", 86, 1.80, "Sedentary")
```

```
[1] 2271.12
```


























