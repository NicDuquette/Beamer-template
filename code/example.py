# Use the "statsmodels" package of econometric commands with "sm" shortcut
import statsmodels as sm

# Define a model regressing y on X using OLS from the sm module
ols_model = sm.OLS(y, X)

# Estimate the model using the .fit attribute
ols_results = ols_model.fit()

# Report the results to the terminal
print(ols_results.summary())