
# Introduction to Python

***

- Libraries
- Data Structures
- Operators
- Flow Control
- Functions

## Python

[Python](https://www.python.org/)is an increasingly popular high-level programming language. It emphasizes legibility over highly complex structure. Python innately provides simple data structures allowing for easy data manipulation. Python provides a simple approach to object-oriented programming, which in turn allows for intuitive programming, and has resulted in a large user community that has created numerous libraries that extend the basic capacities of the language. 

Python is an "interpretted" language. This means that every Python command that is executed is actually translated to lower-level programming languages. Lower-level programming languages are very fast and powerful, but writing programs in these languages can be difficult.

There are two widely-used versions of Python: Python 2 and Python 3. Python 3 is newer and addresses many of the idiosyncracies and inconsistencies that characterized Python 2. However! Python 2 is still widely used; this is because while the fundamentals of the two versions are the same, there are some significant (mostly syntactical) differences between the two, which makes Python 3 NOT backwards compatible. (I.e., code written in Python 2 will, in most cases, not run in Python 3). This means that you'll <strong>always</strong> need to double-check which version of Python a given script is written in. In these sessions, we will be using Python 3.

There are a number of great Python tutorials available on the web, some can be found here:

+ [Python Docs Tutorial](https://docs.python.org/3/tutorial/index.html)
+ [Codecademy](http://codecademy.com/)

There are also some excellent Python textbooks and cookbooks. A simple Amazon search will reveal many. In particular, we recommend the following:

+ [Guttag, John. 2016. *Introduction to Computation and Programming Using Python*. Cambridge, MA: MIT.](https://search.ebscohost.com/login.aspx?direct=true&db=cat01763a&AN=mitcr.000104669&site=eds-live&scope=site)
+ [Shaw, Zed A. 2017. *Learn Python the Hard Way*. Self-Published.](https://www.learnpythonthehardway.org/)
+ [McKinney, Wes. 2012. *Python for Data Analysis: Data Wrangling with Pandas, NumPy, and IPython.* Sebastopol, CA: O'Reilly Media.](https://search.ebscohost.com/login.aspx?direct=true&db=cat00916a&AN=mit.002156304&site=eds-live&scope=site)

## Getting Started

CRON Machines already have Python 3 installed. From a Terminal window (on a Mac) or a Command Prompt Window (on a PC), type `python3` and hit Enter to start the Python console. If at any point, you'd like to quit Python, you simply need to type `quit()` (the parentheses are important).

If you're using your own machine, you may not have Python installed, or you may be running Python 2. Type `python -V` in your terminal to check which version you're running. If it is unable to find a Python installation, or if you're running Python 2, you'll need to [download and install Python 3](https://www.python.org/downloads/). Once you've installed, restart your terminal and type `python3`; you should now be in the Python console.

## Python Libraries

Python is a dynamically typed language. A language has dynamic typing when variable types are not predefined like in a compiled language; the type of a value is evaluated when the code is run, based on how you are attempting to use it. 

Dynamic typing is one of the factors that has led to Python's popularity. However, Python's Standard Library only provides very basic functionality. In order to extend Python’s functionality, its user community has created a very large number of libraries. A library is a module that can be imported to add functionality. Libraries usually take advantage of Object-Oriented-Programming, defining Python objects in additional scripts that can then be instantiated in our current code. 

Loading libraries into our current context can be computationally expensive---loading large libraries (or libraries in large numbers) can hog system resources. For that reason, Python requires us to explicitly load the libraries that we want to use:

```python
import math
```

We can be more specific and import only specific classes or functions of the library:

```python
from math import pi
```

We can also change the name of the library when it gets imported, making it easier to reference:

```python
import matplotlib as plt
```


```python
# Import Libraries for use later in script
import math
import matplotlib
import numpy as np

# If you get an error message stating that "No module named ... ", quit Python using quit()
# After quiting, install the missing library using pip. For example, in the terminal, to
# get matplotlib, type 'conda install matplotlib'
```

#### Comments

Comments let you document your code and are not executed. They are very useful when sharing code, or even when going back to your own code after a while. It is good practice to comment your code. We can have single or multi line comments.

Single-line comments start with the hash character, `#` (AKA, octothorpe, pound sign... [pick your poison](https://en.wikipedia.org/wiki/Number_sign)), and extend to the end of the physical line. A comment may appear at the start of a line or following whitespace or code.

Multiline comments are known as docstrings. They start with `“””` and end with `“””`. 



```python
# This is a single-line comment.

"""
This is a 
multiline
comment
"""

print("Comments worked!")
```

    Comments worked!


## Python Data Structures

A data structure is a way of organizing data in the computer memory. Most languages allow more complicated composite types to be recursively constructed starting from basic types. 

### Variables

Variables allow us to store results, functions or data that we can later retrieve by invoking their name. They give our code persistence. Compared to other programming languages, Python doesn't require that you explicitly define a variable name or its datatype beforehand; you can create variables on the fly! Variables can also be continuously redefined. Python emphasizes legibility, and good naming practices refer specifically to the type of data you are storing.

When you define and assign values to a variable, it will appear as though nothing happened. If you want to see the variable you need to ask the computer to show it to you. Run the first block of code below and see what happens.


```python
x = 4.0
```

We have created a variable x and assigned the value 4.0 to it. However, we did not tell it to show us! To make this request, we use the `print` function to (guess what?) print the value. Let's try that again:


```python
# We can define variables without having to declare their type. We can name it whatever we want.
x = 4.0
x
print(x)
print(x*2)
```

    4.0
    8.0



```python
# you can change the value of x as often as you want.
x = 3
print(x)
x = x+2
print(x)
```

    3
    5



```python
# the following retrieves the value stored in x, adds 2 to it, 
# and stores the result in x.
x+=2
print(x)
x-=10
print(x)
```

    7
    -3



```python
division=5/6
print(division)
print(type(division))
```

    0.8333333333333334
    <class 'float'>


### Numeric Types and Their Methods
Python implements four distinct numeric types: plain integers, long integers, floating point numbers, and complex numbers. In addition, Booleans are a subtype of plain integers.

Every time we define a variable with a number, we are constructing an instance of a specific numeric datatype. Different datatypes have different constructors; to construct a numeric data type, you only need to type it! In general, numeric types (and data types) have methods and properties. Properties store attributes of a given object, and methods allow you to do thing with it!


```python
# Integers (int) are a numerical data-type. 
print(1+2)
print(type(1+2))
```

    3
    <class 'int'>



```python
# Floats are another numeric type that allows for fractions.
print(1.0+.5)
```

    1.5



```python
print(3.0-2.0)
```

    1.0



```python
print(6*5.0)
print(6*5)
```

    30.0
    30



```python
print(7.0/2.0)
print(7/2)
```

    3.5
    3.5



```python
print(type(1.0+5))
```

    <class 'float'>


### Strings
Strings are sets of characters. We can create them by enclosing characters in quotes. Python treats single quotes the same as double quotes.

Strings can be thought of as lists of characters. Therefore, we can access substrings (portions of strings) by specifiying numbered locations in the list. They also have a number of methods or operations that we can perform with them. 


```python
# A string is sequence of characters. 
print("Hello World.")

# Let's store a string in a variable called "s".
# Note that using ' and " to define strings are interchangeable.
string = 'This is a string.'
print(string)
```

    Hello World.
    This is a string.



```python
# We can access individual characters from the string. Python stores the string like an array, think of it as [S, t, r, i, n, g]
# like a list of characters
print(string[2])
```

    i



```python
# You can add strings together
string = string + " Another string."
print(string)
```

    This is a string. Another string.



```python
string+=" A third string."
print(string)
```

    This is a string. Another string. A third string.



```python
# booleans, or bools, are another data type. They can hold only two 
# possible values: True or False.
is_true = True
print(is_true)
```

    True


### Booleans
Booleans are binary datatypes. They have 2 values: **True** and **False** (or 1 and 0). Booleans are useful when testing for truth value; we can test them in an **if** or **while** condition or as operand of Boolean operations. 


```python
# There are several functions that act on booleans.
# Let x and y be variables storing booleans.
# "Not x" switches the value of x. If x is True, then "not x" is False.
# "x and y" returns True if x and y are True.
# "x or y" returns True if x or y are True.
x = True
y = False
print(x)
```

    True



```python
print(not x)
```

    False



```python
print(x and y)
```

    False



```python
print(x and not y)
```

    True



```python
print(x or y)
```

    True



```python
print(not x or y)
```

    False



```python
print(x != y)
```

    True


### Lists 
Lists are a data structure designed for easy storage and access to data. They are initialized by using "**[ ]**" to enclose a comma separated sequence of values. These values can be anything. Lists can contain the same type of values, or a heterogeneous mix of values.  We can access individual elements of a list, a subset of elements, or the whole list. Lists are mutable: we can modify their elements.

Python deals with multiple data structures in a similar manner. For example lists, dictionaries, files, and and iterators work similarly.



```python
L1 = [] # an empty list
x = 5
L2 = [1,2.0,'a',"abcd",True,x] # a list containing different values
# lists can be built dynamically (aka on the fly) using "append" and 
# "extend".
L1.append(1)
L1.append(2)
print(L1)
L3 = ['a','b','c']
L1.extend(L3)
L1.append(L3)
print(L1)
# Values stored in lists are accessible by their index in the list. 
# Lists maintain the ordering in which values were stored in them.
# We use "[i]" to retrieve the i-th element in a list.
# Note that the first element in a list in Python has index 0.
L = ['a','b','c','d','e']
print(L[0])
print(L[1])
# We can access from the ends of lists as well.
print(L[-1])
print(L[-2])
# We can access chunks of a list to produce sub-lists.
print(L[:2])
print(L[2:4])
#print [1,2]+['a','b']
# There is a useful function for producing sequences of numbers.
print(range(10))
print(range(2,10))
print(range(4,10,2))
# The length of a list can be calculated using "len()"
print(len(range(10)))
```

    [1, 2]
    [1, 2, 'a', 'b', 'c', ['a', 'b', 'c']]
    a
    b
    e
    d
    ['a', 'b']
    ['c', 'd']
    range(0, 10)
    range(2, 10)
    range(4, 10, 2)
    10


## Operators 
Operators and operands are something you're familiar with by now - they're special tokens that represent computations like addition, multiplication and division. The values the operators work on are operands. The common ones are +, -, *, **, /
Less common operators include:
// for integar division
% modulus which returns the remainder when the first operand is divided by the second. You would use this if you wanted to check if a number x is divisible by y (in which case the remainder is 0).


```python
# Let's use these less common operators to see why one would need to.
# How would you convert total number of seconds to minutes, second format?
total_secs = 7684
#here we can use integar division to get hours, there are 3600 seconds in an hour
hours = total_secs // 3600
print(hours)
```

    2



```python
#next we can use modulus of  to take the remainder and find minutes
secs_still_remaining = total_secs % 3600
print(secs_still_remaining)
```

    484



```python
#we use integar division again to find the number of minutes
minutes =  secs_still_remaining // 60
print(minutes)
```

    8



```python
#we use modulus again to find the remaining number of seconds
secs_finally_remaining = secs_still_remaining  % 60
print(secs_finally_remaining)
```

    4



```python
#now lets put if all together
print(total_secs, "seconds equals", hours, "hours", minutes, "minutes and", secs_finally_remaining, "seconds!")
```

    7684 seconds equals 2 hours 8 minutes and 4 seconds!


## Comparisons 
A lot of programming is comparing values, so we've already been using comparisons in the code we've written. A couple key distinctions are that '=' is for assignment and '==' is for testing for equality. 
As we've done already when we say x = 1 we are assigning the value 1 to x. If we want to test if x is 1 we would use ==

When testing for equality or any other comparison (<, >, !=) we are asking a question so the result is true or false. 
1 == 1 is asking is 1 exactly equal to 1? So the response would be true. 


```python
# There are functions to make comparisons between valuables and produce bools. 
# '==' tests for equality
print(1 == 2)
print(1 == 1)
```

    False
    True



```python
# '!=' tests for inequality
print(1 != 2)
# comparison functions also apply to strings
print("abcd" == "abcd")
```

    True
    True



```python
# Pointers and their values can be compared.
x = 1
y = 2
# compare values of pointers
print(x == y)
```

    False



```python
# set x and y to be the same pointer 
x = y
print(x)
print(y)
# check if x and y are THE SAME POINTER using the 'is' function.
print(x is y)
```

    2
    2
    True


## Running Python Scripts

So far, we've been using simple commands that only take up one line. But what do we do if we'd like to execute larger blocks of code that we want to be able to work on over time? Python scripts (`.py` files) to the rescue!

Create a new working folder. You can do this from Finder or Windows Explorer, but it might be beneficial to start acquainting yourself with the command line. To create a new folder and navigate to it from the command line, you use the `mkdir` (make directory) and `cd` (change directory) commands, like so:

```sh
mkdir ~/Desktop/python-tutorial
cd ~/Desktop/python-tutorial
```

Note that these commands are the same on Windows and Mac, but the two systems run different 'shells', which means that in many cases commands will differ between the two operating systems. For example, to list the contents of a directory on a mac, type `ls`. On Windows, type `dir`. 

Open Atom or your favorite text editor and save a new file called `pyFun-1.py` to the folder we just created.


## Flow Control
Python is an imperative programming language. In computer science, imperative programming is a programming paradigm that uses statements that change a program's state. We can control the flow of the program through a number of structures. In python there are three main categories of program control flow:

* branches
* loops
* function calls

### Regarding Whitespace in Python

One other feature that makes Python unusual is that *indentation really matters*. In the code below, notice that lines of code following the `if` and `else` statements are indented. While coders make extensive use of indenting in all languages, in most of these other languages, there is no meaning attached to the indentation. Indentation makes code readable, but it for the benefit of the reader, not the computer. A series of commands will function the same way whether they are printed on one line or over many. 

**This is not the case with Python.** Python makes syntactical use of indentation to denote code that is nested. Javascript uses `{}` to perform this same function. So, for example, the following code blocks are equivalent:

```js
// simple Javascript if statement split over multiple lines
var x = true;
if (x == true) {
    console.log("It's the real deal!");
} else {
    console.log("It's a fake!"
}
// simple Javascript if statement on a single line
var x = true; if (x == true) { console.log("It's the real deal!"); } else { console.log("It's a fake!" }
```

```python
# the same if statement written in Python
x = true;
if x == true:
    print("It's the real deal!")
else:
    print("It's a fake!")
```

Which is all to say, Python requires that you code readibly, which means that you can cause errors by not being cautious with your indentation.

### Branching with Booleans

Booleans can be used to control the flow of execution of the code. If-statements execute a section of code if a given bool evaluates to True. There is a specific syntax for booleans, including indentations. Type the following into your `pyFun-1.py` file. When you've finished, ensure that you've changed your terminal directory to the one that includes our Python script and type `python3 pyFun-1.py`. It should execute and you'll see the results printed.


```python
flag = True
x = 0
if flag:
    x = 1
    print("Flag is True.")
else:
    x = 2
    print("Flag is False.")
print(x)
# We can check for other cases as well. Controlling the execution of code
# like this is referred to as "flow of control".
if x == 0:
    print("A")
elif x == 1:
    print('B')
else:
    print("C")
```

    Flag is True.
    1
    B


### Iteration

Loops allow us to automate repetitive tasks. The repeated execution of a set of statements is called iteration. There are a number of way to iterate in Python. We can use `for` loops or `while` loops too. The syntax is like the syntax of if-statements. The `for` loop loops over each of the elements of a list or iterator, assigning the current element to the variable name given. A `while` loop repeats a sequence of statements until some condition becomes false.

Create a new file called `pyFun-2.py` and type in the following code blocks. As you add these, try running the script periodically, changing the variables and seeing what happens!



```python
X = range(10)
print(X)

for x in X:
    print(x)
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9



```python
for i in X:
    # doubles the list element
    print(X[i]*2)

print(X)
```

    0
    2
    4
    6
    8
    10
    12
    14
    16
    18
    range(0, 10)


We can control the execution of a loop through different statements. Python includes statements to exit a loop prematurely. To exit a loop, use the **break** statement. The loop below is a for loop.


```python
for i in range(10):
    print(i)
    if (i > 5):
        break # breaks out of the loop when it gets a number higher than five
```

    0
    1
    2
    3
    4
    5
    6


While loops are also supported. **continue** continues to the next iteration of the loop skipping all the code below, while **break** breaks out of it.


```python
i=0
while i < 10:
    print(i)
    i=i+1
    if i < 5:
        continue
    else:
        break
```

    0
    1
    2
    3
    4


You can iterate through lists.


```python
myList = ["This", "is", "Python"]
for i in myList:
    print(i) # print the value
    print(myList.index(i)) # print the position of the value (index)

```

    This
    0
    is
    1
    Python
    2


Build a list that contains all the courses that you are taking this semester, and print them. Every time you print a course number add the phrase `In Fall 2017, I am taking:`


```python
# Your code here

```

## Functions

Functions allow a programmer to write reusable code to perform a single action. Functions provide better modularity for your application and allow you to code much more efficienty; when you find yourself copy-pasting blocks of code throughout your script, it's often a good cue to write a function instead. Once a function is defined, it can be called by typing the name of the function and passing the arguments. For example, Python gives you many built-in functions (like `print()`).  Functions can just perform an operation, or they can return values.

Functions are defined using the key work `def`. Add the following code block to a new file `pyFun-3.py` and run it from the terminal.



```python
# consider this example:
# First choose an initial value for x.
x = 0
for i in range(100):
    x+=i
print(x)

# What if we do this for a new initial value for x? 
# What if we use a different number instead of 100?
# We don't want to rewrite this for loop every time. 
# Let's define a function.
def ForSum(x,y):
    for i in range(y):
        x+=i
    # "return" indicates what values to output
    return x

# Same calculation from above
print(ForSum(0,100))
print(ForSum(10,50)) # Now with new numbers

# Interestingly, pointers can store functions. This means that functions
# can be inputs to other functions.
F = ForSum
print(F(0,100))

def execute(funct,x):
    return funct(x,100)

print(execute(F,10))

# Now, just for fun:
print(F(F(F(10,100),50),1000))
```

    4950
    4950
    1235
    4950
    4960
    505685


You can also specify default values for your functions, which allows you to call functions without passing all possible parameters and to specify a default behavior.


```python
def print_words(x="THIS",y="Not Bob"):
    print(x)
    print(y)

x = "Bob"
y = "Something else"
    
print_words(x, y)
```

    Bob
    Something else


## That's It for Today!

I'd encourage you to play with the functions we created, check out the resources listed at the top of the page, and try to break things! The nice thing about code is that it's pretty difficult to permanently ruin something; some of the best learning you'll do is while you're debugging and pulling your hair out.

Join us next week when we'll be diving into a very powerful data analysis library for Python: `pandas`. 
