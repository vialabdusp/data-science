
This tutorial is based on content created by Mike Foster and Sarah Williams for the Spring 2017 Big Data and Visualization course.

# Intro to `pandas`

`pandas` is a library for Python for data manipulation and analysis. `pandas` expands the data processing capacities of Python and adds a number of classes for easily importing data, in particular numerical tables, from various formats into their DataFrame object. A DataFrame is `pandas`’s basic object that allows multidimensional data processing and indexing - if you're familiar with R, it should be familiar! It's based on the R's DataFrame class. DataFrames can be easily and efficiently queried without the need of cumbersome syntax and convoluted loops. DataFrames can be merged with other data, they can be sliced, and they can be reshaped; in a way, we can think of Pandas as a big data combination of Excel and SQL. 

### Objective

In this exercise, we want to explore presidential election results in Centre County Pennsyvania. We are going to use Pandas, Numpy, and Matplotlib as our tools to explore the data.

First, there is a short example will introduce us to the dataset, some data wrangling functions of Pandas, and a few plots with Matplotlib.

Throughout the exercises we will be continuously using Pandas and some of its merging functionality to join the numerous OD files available. We will be building exploratory data visualizations, finding patterns and locating divergent areas within the dataset. Some useful documentation for merging data with Pandas can be found at:

http://pandas.pydata.org/pandas-docs/stable/merging.html

### Importing Libraries
First, lets import our libraries.


```python
import pandas as pd
import numpy as np
import matplotlib.pylab as plt
from itertools import cycle, islice

# This line lets us plot on our ipython notebook
%matplotlib inline
```

### Data Frames
Now let's dive into dataframes. This is the basic unit for Python!

You can think of a dataframe as a manipulable, multidimension Python array. They are built to hold structured data; you can perform functions on them to manage data, such as query, select, join, group. Let's setup a really simple dataframe.


```python
# Create empty dataframe
df = pd.DataFrame()

# Create a column
df['name'] = ['Joey', 'Jeremy', 'Jenny']

# View dataframe
df
```

Now let's see how we can use this dataframes with existing datasets

## Reading Files

Pandas provides a number of reader functions that process files and return a pandas object or DataFrame. Multiple different file types can be read, like csv, txt, xls, and json. The function parses the tabular data contained in the files and returns a formatted and indexed DataFrame. A number of additional arguments can be speficied, allowing to define the type of separator for text files, the header, the column to use as an index, etc. 
Additional documentation can be found on the API: http://pandas.pydata.org/pandas-docs/stable/index.html

### Problem 1: Load centrecounty_precinct_results_nov2016.txt into Pandas as a data frame called 'df_voters'.

Next, let's read a files. Let's look at election results from Centre County, PA. Remember that you need to tell pandas where your txt file is. Where did you save your data?


```python
path = './data/centrecounty_precinct_results_nov2016.txt'

df_voters = pd.read_table(path, sep=',')
```

Initially, we only specify that the way the file is seperated is with a comma, but there can be many different arguments that you can additionally include. The internet can tell you about it all! http://pandas.pydata.org/pandas-docs/stable/index.html

When importing large datasets it is handy to take a little preview of the data. If you print *all* of the dataset it would take a while since these datasets have hundreds of thousands of rows. A previes can give you the gist of the data. To do so, we use head() to print the frist 5 rows of the table


```python
# We can print the first 5 rows of the df
df_voters.head()
```

Cool! We just imported data and got a snapshot of what the full dataset looks like. Let's dig in more

### DataFrame methods
The df object has methods, or functions belonging to it, which allow it to do things. For example `df.head()` is a method that shows the first 5 rows of the dataframe. `df.dtypes` returns the data types of each of the columns. 
Additional documentation can be found here: http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html In general, the API is the best resource: http://pandas.pydata.org/pandas-docs/stable/api.html

Other useful dataframe  methods include:

+ `df.dtypes`
+ `df.shape`
+ `df.columns`



```python
#try a dataframe method of your choice! Fill in the code below:
df_voters.
```

To start us off, we need to determine what election results are included in the data. What method can we use to see the differnt column names and see what we can use? Fil in the code below:


```python
#What method can we use to see the column names?
df_voters.
```

Let's say we're interested in seeing what elections are represented in our dataset. The Contest column looks promising! Let's look at what that column contains. We can use the df method .unique() to see the unique values in the column


```python
# View the unique values in the Contest column.
df_voters['Contest'].unique()
```

Wow, a lot of contest types. This is great, but let's stick to the presidential election and query that data.

### Querying
Pandas DataFrames have built-in methods for performing queries. They can be diced, sorted, etc. We can apply any of these queries to parts of the df, and based on this query select subsets of the whole df. Let's do some filtering and querying.

To print out the table with only the rows we want, we can apply what is called a filter. We can use the df mask to get a filtered dataframe: we use the mask to "index" into the dataframe to get the rows we want.


```python
#query just results from the presidential election
df_voters['Contest'] == 'PRESIDENTIAL ELECTORS'
```

While that doesn't look very helpful it's the data that is under the hood of everything we will look at going forward. At it's core the query is just a boolean result, true or false in response to the query (in this case is the contest type presidential electors?)

We can wrap the mask in the dataframe so that the results are more interpretable to a human. Let's try that. 


```python
df_pres = df_voters[df_voters['Contest']== 'PRESIDENTIAL ELECTORS']
df_pres
```

Now that we have data filtered how we want, let's look a little deeper at the different parts of the dataset.
If we scroll over to the right we'll see that there's 'Count' and 'PctCnt'. Those two seem like the columns we'll want.
It's always good to take a second to gut check what you're seeing in the dataframe. It looks like the dataframe has broken up by precinct each candidate, the count of vote results and percent.


### Bar Charts

There's still a lot of disaggregated data. Let's explore the data by making some charts!

To get a simple exploratory plot, we use Matplotlib. Matplotlib is integrated into Pandas, and you can create plots from data frames. For more reading, check out the Matplotlib documentation at [Pandas Plotting Documentation](http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.plot.html) and the [Matplotlib Documentation](http://matplotlib.org/2.0.0/contents.html).


We'll start by grouping the results by each candidate. When we group data we can then use functions like sum on specific columns. When looking at the columns in df_pres, what column would we want to sum? Count would seem like the best option! This column name can be a little confusing because it is also a method.



```python
# Your code here
grouped = df_pres.groupby('Candidate').Count.sum()
grouped
```

This doesn't look as nice as our dataframes! Let's store the results in a dataframe and plot it as a bar chart


```python
df_candidates = grouped.to_frame()
df_candidates.plot.bar(legend=True)

```

How could we further break down the candidates? What if we included Trump, Clinton and grouped everyone else together?


We're doing a lot here - first we make sure to name our columns. If we had multiple columns we could set the array to have multiple names. We also set our index, think of this as our column with unique values

Next, similar to what we did for the candidates dataframe we want to take the totals from df_candidates for each candidate and then combine the results for everyone NOT Clinton or Trump. Note that for that we use the [column_name].sum() rather than the [column_name].item()

You will then need to create a new numpy array that contains the summed valued for each group and create the new data frame with your answer. This [Stack Exchange Question](http://stackoverflow.com/questions/17839973/construct-pandas-dataframe-from-values-in-variables) will help you, along with the [Pandas documentation on DataFrames](http://pandas.pydata.org/pandas-docs/stable/dsintro.html#dataframe).



```python
#let's see what df_candidates looks like. 
df_candidates
```


```python
#to set up this dataframe we need to set the columns and the index so we can reference them
df_candidates.columns = ['NUMBER']
df_candidates.index.names = ['Candidate']
```


```python
df_candidates
```

Now we can create an array with the numbers aggregated the way we want. You'll notice that instead of querying the dataframe the way we did before we use .index

Does it make sense how we sum the rest of the candidates? What methods are used to get the actual numbers of votes for each candidate? 


```python
#creating an array with the numbers we want
values = np.array([df_candidates[(df_candidates.index == 'HILLARY CLINTON,  PRESIDENT')].NUMBER.item(),
                   df_candidates[(df_candidates.index == 'DONALD J TRUMP,  PRESIDENT')].NUMBER.item(),
                   df_candidates[(df_candidates.index != 'HILLARY CLINTON,  PRESIDENT') & (df_candidates.index != 'DONALD J TRUMP,  PRESIDENT')].NUMBER.sum()])

#turning that aray into a dataframe with an array with corresponding candidate names
cand = ["Clinton", "Trump", "Other"]
df_pres_res = pd.DataFrame(values, index=cand)
df_pres_res.columns = ['Votes']
df_pres_res


```


```python
df_pres_res.plot.bar(legend=True)
```

There we have it! The presidential election results for one county in Pennsylvania in a bar chart!         

## Part 2 - Scatterplotting

Now we will use the **precinct_centroids** file provided to display the geographical location of the centroid of each precinct, plot them in a scatterplot, then size the points in the scatterplot according to the number of votes. We can understand some spatial components to election results by using scatterplot to show lat/long.

First, load the CSV.


```python
df_precinct_locations = pd.read_table('./data/center_county_precinct_centroids.csv', sep=',', low_memory=False)
df_precinct_locations.head()
```

Now that we have a new `DataFrame` for each precinct and the geographical location of its centroid, we can use lat/lon values to create a scatter plot. We can even vary their size based on the variables or criteria we set. If variation across precincts is not that big, we can use a log function to better visualize it on our plot. Numpy has a quick log implementation:
```Python
np.log(value)
```
In this following example, we give the points a simple size of 25.


```python
plt.scatter(df_precinct_locations['X'],df_precinct_locations['Y'], s=25)
plt.show()
```

**Task 4: Using the above example, and the documentation on scatterplots, create two scatterplots using longitude and latitude X and Y locations, one showing percentage of vote for Trump, and other percentage of vote for Clinton. Make the Trump dots colored red, and Clinton blue.**

Find the [Scatterplot documentation here](http://pandas.pydata.org/pandas-docs/version/0.19.1/visualization.html#scatter-plot)

You will need to join the results precincts file to the centroids, and then set the size of the plot points to be the percentages. This is accessed using the S property.

To perform the join, use merge. This [Stack Exchange](http://stackoverflow.com/questions/20375561/joining-pandas-dataframes-by-column-names) question will help!

Let's this about what data we want in the results:
We will need to get:
    the total number of voters in each precinct 
    total votes for Trump in each precinct 
    total votes for Clinton in each precinct
    X/Y coordinates for the precincts
    
To guide you through the process, let's break the problem into 5 steps. They build on some of the things we've gone  over. 




**A few tips** we will use the .loc method for dataframes to allow for label based indexing 
https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.loc.html

We also introduce setting types with the astype() method

Joins and merges are standard in data science and programming. If you need some background information on Joins
http://www.pythonforbeginners.com/data-types/python-join-examples
https://chrisalbon.com/python/pandas_join_merge_dataframe.html
    


```python
# Map 1: Votes for Trump

#Step 1: Query out all voters who voted in the election - hint you can use the contest column to find all registered voters
df_res_RV= df_voters.loc[df_voters['Contest'] == 'REGISTERED VOTERS - TOTAL']
df_sum_RV = df_res_RV[['PrecNo', 'Count']].astype(int).set_index('PrecNo')
df_sum_RV.columns = ['Count']
df_sum_RV
```


```python
#Step 2: Query out voters who voted for Trump
df_trump = df_pres.loc[df_pres['Candidate'] == 'DONALD J TRUMP,  PRESIDENT']
grouped = df_trump.groupby(['PrecNo']).Count.sum()
df_trumpgrp = df_trump[['PrecNo', 'Count']].astype(float).set_index('PrecNo')
df_trumpgrp.columns= ['Count']
df_trumpgrp
```


```python
#Step 3: Join voters for Trump with total voters in the election and compute the percentage
df_join = df_trumpgrp.join(df_sum_RV, lsuffix='_Results', rsuffix='_Total')
df_join['percent'] = np.multiply(np.divide(df_join['Count_Results'], df_join['Count_Total']), 100)
df_join
```


```python
#Step 4:Extract x, y and precinct from the precinct locations file
df_location = df_precinct_locations[['Precinct', 'X', 'Y']].astype(float).set_index('Precinct')
#merge the two dataframes, based on the index
df_compare = pd.merge(df_join, df_location, right_index=True, left_index=True)

df_compare

```


```python
#Step 5: Create a scatterplot, where circle size varies by percent votes received
plt.scatter(df_compare['X'],df_compare['Y'], color='DarkRed', s=df_compare['percent']**1.2)
plt.title('Spatial Distribution of Trump Votes - as percent of total votes')
plt.legend('% Vote', fontsize = 'medium')
#plt.legend.handlelength()
plt.ylabel('Y-Coord')
plt.xlabel('X-Coord')
plt.show()

```

Wahoo! Now can you do the same thing for results for HIllary and see how the two compare?
